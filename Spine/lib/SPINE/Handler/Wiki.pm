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
use SPINE::Constant;
use Data::Dumper;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my ($params) = $tag =~ m,\(([^\)]*)\),g;
  my $action = $request->param("action");
  my $page = $ENV{PATH_INFO};
  $page =~ s/^\\+//g;
  $page =~ s/^\/+//g;
  my @params = split(/,/,$params);
  my $body = "";
  my $wiki_dbi = SPINE::DBI::Wiki->new($dbh);
  my $revision_dbi = SPINE::DBI::Revision->new($dbh);
  my $wiki = shift @{$wiki_dbi->get({name=>$page, count=>1})};
  if ($action eq "Create" && $page) #Add Wiki here - Saving
  { $action = ""; 
    my $new_wiki = SPINE::Base::Wiki::default;
    my $body = $request->param("body");
    $new_wiki->name($page);
    $new_wiki->body($body);  
    $wiki_dbi->add($new_wiki);
    $wiki = $new_wiki;
  }
  if ($action eq "Save" && $page) #Update Wiki
  { $action = ""; 
    my $body = $request->param("body");
    my $old_body = $wiki->body;
    my $revision = shift @{$revision_dbi->get({name=>$page, count=>1})};
    $revision ||= SPINE::Base::Revision::default;
    $revision->body($old_body);
    $revision->name($page);
    $revision->changetype("update");
    $revision->revise;
    $revision_dbi->add($revision);
    $wiki->body($body);
    $wiki_dbi->update($wiki);
  }
  if ($action eq "Delete" && $page) #Delete Wiki
  { $action = ""; 
    my $revision = shift @{$revision_dbi->get({name=>$page, count=>1})};
    my $old_body = $request->param("body");
    $revision ||= SPINE::Base::Revision::default;
    $revision->body($old_body);
    $revision->name($page);
    $revision->changetype("delete");
    $revision->revise;
    $revision_dbi->add($revision);
    $wiki_dbi->delete($wiki);
  }
  if (!$wiki && $page) #New Wiki
  { $body = qq(<form method="post"">
<textarea cols="60" rows="20" name="body"></textarea><input type="submit" name="action" value="Create"></form>);
  }
  if ($action eq "Edit" && $page && $wiki) #Edit Wiki
  { my $wiki_body = $wiki->body;
    $body = qq(<form method="post"><textarea cols="60" rows="20" name="body">$wiki_body</textarea><input type="submit" name="action" value="Save"></form>);
  }
  if (!$action && $page && $wiki) #Plain View
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

This is spine 1.1.

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
