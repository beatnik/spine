package SPINE::Handler::Admin::Adminaccess;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.18 $

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Macro;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Attribute;
use SPINE::DBI::Content;
use SPINE::Constant;

use Data::Dumper;

use strict;

use SPINE::Transparent::Constant;
use SPINE::Transparent::Request;

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms $attribute_dbi %i18n %default);
use vars qw($valid_perms_string $enter_name_string $create_adminaccess_string $remove_adminaccess_string $save_adminaccess_string $adminaccess_exists_string $adminaccess_notexists_string $ierror $lang);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;
  my $url = $request->uri;
  my $location = $request->location;
  $error = '';
  $ierror = '';
  %default = ();
  %i18n = ();
  
  $url =~ s/^$location\/?//;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  $url = '.admin-access'; 

  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = %{$_} if $_;
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>$lang)};
  for(@i18n_hash)
  { my %hash = %{$_} if $_;
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_adminaccess_string = $i18n{'create_adminaccess'} || "Add new admin access permissions<br>";
  $remove_adminaccess_string = $i18n{'remove_adminaccess'} || "Remove admin access permissions<br>";
  $save_adminaccess_string = $i18n{'save_adminaccess'} || "Save admin access permissions<br>";
  $adminaccess_exists_string = $i18n{'adminaccess_exists'} || "These admin access permissions already exist!<br>";
  $adminaccess_notexists_string = $i18n{'adminaccess_not_exists'} || "These admin access permissions does not exist!<br>";
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'adminaccess'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;
  
  shift @params;

  $error = "";

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_adminaccess_string;    
    $url = '.admin-access'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_adminaccess_string;
    $url = '.admin-access'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_adminaccess_string;
    $url = '.admin-access'; 
  }

  if (($params[0] eq 'save')  && !$error)
  { save(); 
    $url = '.admin-access';
  }

  if ($params[0] eq 'remove' && !$error)
  { remove(); 
  }

  my $edit_adminaccess = shift @{$adminaccess_dbi->get({section=>$request->param('section'), usergroup=>$request->param('usergroup')}, count=>1)};
  if ($edit_adminaccess && $params[0] eq 'new' && !$error)
  { $error = $adminaccess_exists_string;
    $url = '.admin-access'; 
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return (SPINE::Base::Content::default(),$SPINE::Transparent::Constant::NOT_FOUND); }

  if ($params[0] eq 'new' && $request->param("section") && $request->param("usergroup"))
  { my $read = defined($request->param('read')) ? $request->param('read') : 0;
    my $write = defined($request->param('write')) ? $request->param('write') : 0;
    my $exec = defined($request->param('exec')) ? $request->param('exec') : 0;
    my $permissions = $read.$write.$exec;
    $adminaccess_dbi->add(SPINE::Base::Adminaccess->new({section=>$request->param('section'), usergroup=>$request->param('usergroup'), permissions=>$permissions})); 
  }

  my $body = $content->body if ref $content;
  my @adminaccess = @{$adminaccess_dbi->get()};
  my $list = undef;
  my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
  my $group = undef;
  for(@groups) { $group .= qq(<option>$_); }
  my $permissions = qq(<input type="checkbox" name="read" value="1"><input type="checkbox" name="write" value="1"><input type="checkbox" name="exec" value="1">);
  $list .= qq(<tr bgcolor="#ffffff"><form action="<?SPINE_Location?>admin/adminaccess/new/" method="post"><td><input type="text" name="section" class="input" value="" size="30">\n</td><td><select name="usergroup">$group</select>\n</td><td>$permissions\n</td>\n<td><input type="submit" value="Create" class="button" name="action"></td>\n</form><td>&nbsp;</td></tr>\n); 
  for(@adminaccess)
  { my %hash = $_->tohash;
    my $group = undef;
    my @perms = $hash{permissions} =~ /^(\d)(\d)(\d)$/;
    my @checked = (""," checked");
    for(@groups) { my $sel = $hash{"usergroup"} eq $_ ? ' selected' : ''; next if !$_; $group .= qq(<option$sel>$_); }
    my $permissions = qq(<input type="checkbox" name="read" value="1"$checked[$perms[0]]><input type="checkbox" name="write" value="1"$checked[$perms[1]]><input type="checkbox" name="exec" value="1"$checked[$perms[2]]>);
    $list .= qq(<tr bgcolor="#ffffff"><form action="<?SPINE_Location?>admin/adminaccess/save/" method="post"><input type="hidden" name="id" value="$hash{id}">\n<td><input type="text" name="section" class="input" value="$hash{section}" size="30">\n</td><td><select name="usergroup">$group</select>\n</td><td>$permissions\n</td>\n<td><input type="submit" value="Save" class="button" name="action"></td>\n</form><form action="<?SPINE_Location?>admin/adminaccess/remove/" method="post"><input type="hidden" name="name" value="$hash{name}"><input type="hidden" name="id" value="$hash{id}">\n<td><input type="submit" value="Delete" class="button" name="action"></td>\n</form></tr>\n); 
  }
  $body =~ s/\$list/$list/g;
  $body =~ s/\$error/$error/g;
  $content->body($body);
  return $content;
}

sub save
{ my $adminaccess = shift @{$adminaccess_dbi->get({id=>$request->param('id'), count=>1})};
  my $read = defined($request->param('read')) ? $request->param('read') : 0;
  my $write = defined($request->param('write')) ? $request->param('write') : 0;
  my $exec = defined($request->param('exec')) ? $request->param('exec') : 0;
  my $permissions = $read.$write.$exec;
  $adminaccess->section($request->param('section')) if ref $adminaccess;
  $adminaccess->usergroup($request->param('usergroup')) if ref $adminaccess;
  $adminaccess->permissions($permissions) if ref $adminaccess;
  $adminaccess_dbi->update($adminaccess) if $adminaccess;
}

sub remove
{ my $adminaccess = shift @{$adminaccess_dbi->get({id=>$request->param('id'), count=>1})};
  $adminaccess_dbi->delete($adminaccess) if $adminaccess;
}


1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Adminaccess

=head1 DESCRIPTION

This is the Admin Access Control Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

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
