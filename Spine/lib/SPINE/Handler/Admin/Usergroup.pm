package SPINE::Handler::Admin::Usergroup;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:45 $ - $Revision: 1.3 $

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Attribute;
use SPINE::DBI::Content;
use SPINE::Constant;

use Data::Dumper;

use strict;

use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms %i18n %default $attribute_dbi);
use vars qw($valid_perms_string $enter_name_string $create_usergroup_string $remove_usergroup_string $edit_usergroup_string $save_usergroup_string $usergroup_exists_string $usergroup_notexists_string);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();

  SPINE::Transparent::Constant->new($request);
  my %cookies = $request->cookies;
  %default = ();
  %i18n = ();

  my $url = $request->uri;
  my $location = $request->location;
  
  $url =~ s/^$location\/?//mx;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);   
  $url = '.admin-usergroup'; 

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'usergroup'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = ();
    if ($_) { %hash = %{$_}; }
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }

  my $lang = $default{'lang'} || "";
  $lang = ".$lang" if $lang;
  $lang = "" if $lang eq ".en";

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>$lang)};
  for(@i18n_hash)
  { my %hash = undef;
    if ($_) { %hash = %{$_}; }
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_usergroup_string = $i18n{'create_usergroup'} || "Add a user to a usergroup";
  $remove_usergroup_string = $i18n{'remove_usergroup'} || "Remove a user from a usergroup";
  $usergroup_exists_string = $i18n{'usergroup_exists'} || "This user is already part of this usergroup!";
  
  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;
  
  shift @params;

  $error = "";

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_usergroup_string; 
    $url = '.admin-usergroup'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_usergroup_string; 
    $url = '.admin-usergroup'; 
  }
  
  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { remove(); 
  }

  my $edit_usergroup = shift @{$usergroup_dbi->get({usergroup=>$request->param('usergroup'),username=>$request->param('username')}, count=>1)};
  if ($edit_usergroup && $params[0] eq 'new' && !$error)
  { $error = $usergroup_exists_string; 
    $url = '.admin-usergroup';  
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }

  if (!$error && $params[0] eq 'new' && $request->param("usergroup") && $request->param("username") && $request->method eq "POST")
  { $usergroup_dbi->add(SPINE::Base::Usergroup->new({usergroup=>$request->param('usergroup'), username=>$request->param('username')})); }

  my $body = undef;
  $body = $content->body if ref $content;
  if ($url eq ".admin-general")
  { $content->title("Usergroup Administration"); }

  my $list = undef;
  my @groups = @{$usergroup_dbi->get()};
  my @users = @{$user_dbi->getlist(field=>'login')};
  my $group = undef;
  my $user = undef;
  for(@users) { $user .= qq(<option>$_); }
  $list .= qq(<div name="adminpanel" class="fullpanel"><form action="<?SPINE_Location?>admin/usergroup/new/" method="post" method="post">\n);
  $list .= qq(<div class="panelcel" style="width: 20%"><select name="username">$user</select></div>\n);
  $list .= qq(<div class="panelcel" style="width: 20%"><input type="text" name="usergroup" class="input" value="" size="30"></div\n);
  $list .= qq(<div class="panelcel" style="width: 20%"><input type="submit" value="Create" class="button" name="action"></div><div class="spacercel"></div></form></div>\n);
  for(@groups)
  { my %hash = $_->tohash;
    my $group = undef;
    for(@groups) { my $sel = $hash{"usergroup"} eq $_ ? ' selected' : ''; next if !$_; $group .= qq(<option$sel>$_); }
    $list .= qq(<div name="adminpanel" class="fullpanel"><form action="<?SPINE_Location?>admin/usergroup/remove/" method="post">\n);
    $list .= qq(<input type="hidden" name="usergroup" value="$hash{usergroup}"><input type="hidden" name="username" value="$hash{username}"><input type="hidden" name="id" value="$hash{id}">\n);
    $list .= qq(<div class="panelcel" style="width: 20%">$hash{username}</div><div class="panelcel" style="width: 20%">$hash{usergroup}</div>\n);
    $list .= qq(<div class="panelcel" style="width: 20%"><input type="submit" value="Delete" class="button" name="action"></div><div class="spacercel"></div></form></div>\n);
  }
  if ($error) { $error = qq(<p class="error">$error</p>); }
  $body =~ s/\$list/$list/gmx;
  $body =~ s/\$error/$error/gmx;
  $content->body($body);
  return $content;
}

sub remove
{ my $usergroup = $usergroup_dbi->get({id=>$request->param('id'), count=>1}); 
  $usergroup_dbi->remove($usergroup) if $usergroup;
  return;
}


1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Usergroup

=head1 DESCRIPTION

This is the Admin Usergroup Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.3 beta.

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
