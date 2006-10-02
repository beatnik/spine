package SPINE::Handler::Wiki;

## This module is part of SPINE
## Copyright 2000-2005 Hendrik Van Belleghem
## SPINE is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.

## SPINE is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with Foobar; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## See COPYING and LICENSE for more information on the GPL   
## http://spine.sourceforge.net                  
## beatnik@users.sf.org        

#Apache::Request Handler
#DB Handler

use strict;

use vars qw($VERSION);
use SPINE::DBI::Wiki;
use SPINE::DBI::Revision;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Session;
use SPINE::Constant;
use Data::Dumper;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my ($params) = $tag =~ m/\(([^\)]*)\)/gmx;
  my $action = $request->param("action");
  my $page = $ENV{PATH_INFO};
  $page =~ s/^\\+//gmx;
  $page =~ s/^\/+//gmx;
  my %cookies = Apache::Cookie->fetch;
  my @params = split(/,/,$params);
  my $body = "";
  my $wiki_dbi = SPINE::DBI::Wiki->new($dbh);
  my $wiki_owner = undef;
  my $revision_dbi = SPINE::DBI::Revision->new($dbh);
  my $user_dbi = SPINE::DBI::User->new($dbh);  
  my $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);    
  my $wiki = shift @{$wiki_dbi->get({name=>$page, count=>1})};
  
  # ----------------------
  my $readwiki = undef;
  my $writewiki = undef;
  if ($wiki)
  { my $user = shift @{$user_dbi->get({login=>$wiki->owner})};
  
    my $session = undef;
    $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
    # if (($session && !$session->username) || !$session)
    #{ $session = $s if ($s && $s->username); }
    my $writewperms = $wiki->permissions & WRITEWPERMISSIONS;
    $writewperms =~ s/0//gmx;
    my $readwperms = $wiki->permissions & READWPERMISSIONS;
    $readwperms =~ s/0//gmx;
    $readwiki = $readwperms;
    $writewiki = $writewperms; 
  
    if ($session && $user && $session->username eq $user->login && $session->host eq $request->get_remote_host && !$writewiki)
    { my @usergroups =  @{ $usergroup_dbi->get({username=>$session->username}) };
      @usergroups = map { $_ = $_->usergroup } @usergroups;
      my $writegperms = $wiki->permissions & WRITEGPERMISSIONS;
      my $readperms = $wiki->permissions & READACCESS;
      $readperms =~ s/0//gmx;
      my $writeperms = $wiki->permissions & WRITEACCESS;
      $writeperms =~ s/0//gmx;
      my $execperms = $wiki->permissions & EXECACCESS;
      $writewiki = 
      ($session->username eq 'admin') ||
      ($wiki->owner eq $session->username) ||
      (@usergroups && $writeperms);
      $readwiki = ($session->username eq 'admin') ||
      ($wiki->owner eq $session->username) ||
      (@usergroups && $readperms);
      $wiki_owner = $session->username if $writewiki;
    }
    # -------------------------  
  }else 
  { $writewiki = 1; $readwiki = 1; $wiki_owner = "Anonymous"; }
  
  if ($action eq "Create" && $page) #Add Wiki here - Saving
  { $action = ""; 
    my $new_wiki = SPINE::Base::Wiki::default;
    my $body = $request->param("body");
    $new_wiki->name($page);
    my $owner = $wiki_owner || "Anonymous";
    $new_wiki->body($body);  
    $new_wiki->owner($owner);
    $wiki_dbi->add($new_wiki);
    $wiki = $new_wiki;
  } 
  
  if ($action eq "Save" && $page && $writewiki) #Update Wiki
  { $action = ""; 
    my $body = $request->param("body");
    my $old_body = $wiki->body;
    my $revision = shift @{$revision_dbi->get({name=>$page, count=>1})};
    $revision ||= SPINE::Base::Revision::default;
    $revision->body($old_body);
    $revision->name($page);
    my $owner = $wiki_owner || "Anonymous";
    $wiki->owner($owner);
    $revision->changetype("update");
    $revision->revise;
    $revision->owner($owner);
    $revision_dbi->add($revision);
    $wiki->body($body);
    $wiki_dbi->update($wiki);
  }
  
  if ($action eq "Delete" && $page && $writewiki) #Delete Wiki
  { $action = ""; 
    my $revision = shift @{$revision_dbi->get({name=>$page, count=>1})};
    my $old_body = $request->param("body");
    $revision ||= SPINE::Base::Revision::default;
    $revision->body($old_body);
    $revision->name($page);
    my $owner = $wiki_owner || "Anonymous";
    $revision->owner($owner);
    $revision->changetype("delete");
    $revision->revise;
    $revision_dbi->add($revision);
    $wiki_dbi->remove($wiki);
  }
  if (!$wiki && $page) #New Wiki
  { $body = qq(<form method="post">
<textarea cols="60" rows="20" name="body"></textarea><input type="submit" name="action" value="Create"></form>);
  }
  if ($action eq "Edit" && $page && $wiki && $writewiki) #Edit Wiki
  { my $wiki_body = $wiki->body;
    $body = qq(<form method="post"><textarea cols="60" rows="20" name="body">$wiki_body</textarea><input type="submit" name="action" value="Save"></form>);
  }
  if (!$action && $page && $wiki && $readwiki) #Plain View
  { my $wiki_body = $wiki->body;
    $body = $wiki_body.qq(<form method="post"><input type="submit" name="action" value="Delete"><input type="submit" name="action" value="Edit"></form>); 
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Wiki

=head1 DESCRIPTION

This is the Wiki plugin for SPINE.

=head1 SYNOPSIS

 <?SPINE_Wiki?>

=head1 USAGE

To use the Wiki plugin, insert the tag on a page (e.g Wiki) and surf to

 http://www.yourhost.com/Wiki/TheUniverseLifeAndEverything

Everything passed after Wiki/ (in this example) is used as a key to look up.

=head1 BETA

This module/plugin is in BETA

=head1 VERSION

This is spine 1.2 beta.

=head1 AUTHOR

Hendrik Van Belleghem - b e a t n i k   a t   u s e r s  d o t  s f  d o t  n e t

=head1 LICENSE

SPINE is distributed under the GNU General Public License.

Read LICENSE for more information.

=head1 SEE ALSO

SPINE::*

Apache::SPINE::*

Apache::Request

Apache::Cookie

http://spine.sf.net

=cut
