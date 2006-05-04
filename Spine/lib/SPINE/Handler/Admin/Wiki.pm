package SPINE::Handler::Admin::Wiki;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.54 $

use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Style;
use SPINE::DBI::Content;
use SPINE::DBI::Style;
use SPINE::DBI::Macro;
use SPINE::DBI::Session;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Wiki;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Constant;
use SPINE::Transparent::Request;

#Apache::Request Handler
#DB Handler

use vars qw($VERSION $content_dbi $style_dbi $user_dbi $usergroup_dbi $macro_dbi $adminaccess_dbi $session_dbi $wiki_dbi $request $user $adminaccess $error $ierror $readperms $writeperms $execperms);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();

  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;

  my $page = $request->param('name');
  my $url = $request->uri;
  my $location = $request->location;
  $error = '';
  $ierror = '';
  
  $url =~ s/^$location\/?//;

  ($url,@params) = split("/",$url);
  
  $content_dbi = SPINE::DBI::Content->new($dbh);
  $style_dbi = SPINE::DBI::Style->new($dbh);
  $wiki_dbi = SPINE::DBI::Wiki->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);

  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user, count=>1}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'wiki'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;
  
  shift @params;
  #@params is something like qw(wiki new);
  #And we already know it's in wiki so discard first element
  if (!$params[0] || !$page || $page eq 'Enter name')
  { $url = '.admin-general'; @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = 'You do not have valid permissions for this operation : Creating new wiki<br>'; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = 'You do not have valid permissions for this operation : Remove wiki<br>'; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = 'You do not have valid permissions for this operation : Edit wiki<br>'; 
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = 'You do not have valid permissions for this operation : Save wiki<br>'; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = 'You do not have valid permissions for this operation : Copying wiki<br>'; 
    $url = '.admin-general'; 
  }

  my $edit_wiki = shift @{$wiki_dbi->get({name=>$page}, count=>1)};
  if ($edit_wiki && $params[0] eq 'new' && !$error)
  { $error = 'This wiki already exists!<br>'; 
    $url = '.admin-general'; 
  }

  if (!$edit_wiki && ($params[0] eq 'save' || $params[0] eq 'edit' || $params[0] eq 'copy' || $params[0] eq 'remove')&& !$error)
  { $error = 'This wiki does not exist!<br>'; 
    $url = '.admin-general'; 
  }
 
  if ($params[0] eq 'new' && !$error)
  { my $w = SPINE::Base::Wiki::default(); 
    $w->name($page); $w->owner($user);
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $w->modified("$year-$mon-$day $hour:$min:$sec") if ref $w;
    $wiki_dbi->add($w);
    $url = '.admin-wiki'; 
  }

  if ($params[0] eq 'edit' && !$error)
  { $url = '.admin-wiki'; }
  
  if ($params[0] eq 'save' && !$error)
  { $url = '.admin-wiki'; 
    save();
  }

  if ($params[0] eq 'copy' && !$error)
  { $url = '.admin-general'; 
    copy();
  }

  if ($params[0] eq 'remove' && !$error)
  { $url = '.admin-general'; 
    remove();
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return NOT_FOUND; }
  my $style = shift @{$style_dbi->get({name=>$content->style, count=>1})};
  if (!ref $style)
  { $content = shift @{$content_dbi->get({name=>".404", count=>1})} || SPINE::Base::Content::default(); 
    my $body = $content->body;
    $body =~ s/\$page/$url/g;
    my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/;
    $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
    $body =~ s/\$serversig/$serversig/g;
    $content->body($body);
  }
  my $body = $content->body if ref $content;

  #This part is tricky. This part will merge permissions (r-- in group A and -wx in group B = rwx)
  if ( ($params[0] eq 'edit' || $params[0] eq 'save' || $params[0] eq 'new') && !$error)
  { my $edit_wiki = shift @{$wiki_dbi->get({name=>$page}, count=>1)};
    my $cbody = undef;    

    $cbody = $edit_wiki->body if ref $edit_wiki;
    my @selected = ('',' checked');
    my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
    my $group = undef;
    for(@groups) { my $sel = $edit_wiki->usergroup eq $_ ? ' selected' : ''; next if !$_; $group .= qq(<option$sel>$_); }
    my @perms = $edit_wiki->permissions =~ /^(\d)(\d)(\d)(\d)/;
    my @checked = (""," checked");
    my $gpermissions = qq(Read: <input type="checkbox" name="groupr" value="1"$checked[$perms[0]]>);
    $gpermissions .= qq(Write: <input type="checkbox" name="groupw" value="1"$checked[$perms[1]]>);
    my $wpermissions = qq(Read: <input type="checkbox" name="worldr" value="1"$checked[$perms[2]]>);
    $wpermissions .= qq(Write: <input type="checkbox" name="worldw" value="1"$checked[$perms[3]]>);
    $cbody =~ s/\&/\&amp\;/g; 
    $cbody =~ s/\</\&lt\;/g;
    $cbody =~ s/\>/\&gt\;/g;
    $body =~ s/\$name/$edit_wiki->name/ge if ref $edit_wiki;
    $body =~ s/\$owner/$edit_wiki->owner/ge if ref $edit_wiki;
    $body =~ s/\$lastmod/$edit_wiki->modified/ge if ref $edit_wiki;
    $body =~ s/\$gpermissions/$gpermissions/g;
    $body =~ s/\$wpermissions/$wpermissions/g;
    $body =~ s/\$error/$ierror/g; 
    $body =~ s/\$body/$cbody/g;
  } 

  if ( ( (!$params[0] || $params[0] eq 'copy' || $params[0] eq 'remove') && $params[0] ne 'edit' ) || $error )
  { my @li = @{$wiki_dbi->get()}; 
    my $list = undef;
    my $c = undef;
    my @list = ();

    #Only show hidden files in the listing if you are admin
    #Comment these 2 lines if you wish to include the dot-files in the listing..
    if ($user ne 'admin')
    { @li = grep { $_->name =~ /^[^\.]/ } @li; }
    
    for $c (@li)
    { my $readgperms = $c->permissions & READGPERMISSIONS;
      $readgperms =~ s/0//g;
      my $readwperms = $c->permissions & READWPERMISSIONS;
      $readwperms =~ s/0//g;
      my @groups = grep { $_ eq $c->usergroup } @usergroups;
      if ( ($user eq 'admin' || #User is admin
            $c->owner eq $user || #User is owner of content
            $readwperms) || #Content is world readable
            (@groups && $readgperms) #Content is group readable and user is part of group
         )
       { push(@list,$c->name); next; }
    }  
    for(@list) { $list .= qq(<option value="$_">$_\n); }
    $body =~ s/\$list/$list/g;
    $body =~ s/\$type/wiki/g;
    $body =~ s/\$label/Wiki/g;
    $body =~ s/\$error/$error/g;        
  } 
  $content->body($body);
  return $content;
}

sub save
{ my $wiki = shift @{$wiki_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $wiki->owner eq $user || 
      $wiki->permissions =~ /^\d1/ || $wiki->permissions =~ /\d1$/)
  { $wiki->body($request->param('body')) if ref $wiki;
    my $permissions = scalar $request->param('groupr') ? "1" : 0;
    $permissions .= scalar $request->param('groupw') ? "1" : 0;
    $permissions .= scalar $request->param('worldr') ? "1" : 0;
    $permissions .= scalar $request->param('worldw') ? "1" : 0;      
    $wiki->permissions($permissions) if ref $wiki;
    $wiki->usergroup($request->param('usergroup')) if ref $wiki;
    $wiki->icomment($request->param('icomment')) if ref $wiki;  
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $wiki->modified("$year-$mon-$day $hour:$min:$sec") if ref $wiki;
    $wiki_dbi->update($wiki);
  }
  else
  { $ierror = 'You do not have valid permissions for this operation : Save wiki<br>'; }
}

sub copy
{ my $wiki = shift @{$wiki_dbi->get({name=>$request->param('name')})};
  if ($user eq 'admin' || $wiki->owner eq $user || 
      $wiki->permissions =~ /^1/ || $wiki->permissions =~ /1\d$/)
  { $wiki->name($request->param('target'));
    $wiki->id(0);
    $wiki_dbi->add($wiki);
  }
}

sub remove 
#Document: You need both read and write permissions to delete a content
{ my $wiki = shift @{$wiki_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $wiki->owner eq $user || 
      $wiki->permissions =~ /^\11/ || $wiki->permissions =~ /11$/)  
  { $wiki_dbi->delete($wiki); }
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Wiki

=head1 DESCRIPTION

This is the Admin Wiki Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 APACHE CONFIG

How to set up Apache::SPINE::Index in your Apache config file...

  <IfModule mod_perl.c>
   PerlModule Apache::DBI
 
  <Location /hendrik>
    SetHandler perl-script
    PerlHandler Apache::SPINE::Index
    PerlSetVar dbd mysql
    #Declare the Database Driver here
    PerlSetVar dbname spine
    #Declare the database name here
    PerlSetVar dbuser user
    #Declare the database user here
    PerlSetVar dbpwd password
    #Declare the database password here
    PerlSetVar main index.html
    #Define the main content here
    PerlLogHandler Apache::SPINE::Log
   </Location>

  </IfModule>

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
