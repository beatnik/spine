package SPINE::Handler::Admin::User;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.46 $

use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Attribute;
use SPINE::DBI::Content;
use SPINE::DBI::Session;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Constant;
use Digest::MD5 qw(md5_hex);

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $adminaccess_dbi $session_dbi $request $readperms $writeperms $execperms $user $adminaccess $error %i18n %default $attribute_dbi);
use vars qw($valid_perms_string $enter_name_string $create_user_string $remove_user_string $edit_user_string $save_user_string $user_exists_string $user_notexists_string);

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
  $url = '.administration/user'; 
  
  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'users'}) }); }
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
  $create_user_string = $i18n{'create_user'} || "Add a new user";
  $remove_user_string = $i18n{'remove_user'} || "Remove a user";
  $edit_user_string = $i18n{'edit_user'} || "Edit a user";
  $save_user_string = $i18n{'save_user'} || "Save a user";
  $user_exists_string = $i18n{'user_exists'} || "This user already exists!";
  $user_notexists_string = $i18n{'user_not_exists'} || "This user does not exist!";
    
  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;
  
  shift @params;

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_user_string; 
    $url = '.administration/user'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_user_string; 
    $url = '.administration/user'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_user_string; 
    $url = '.administration/user'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_user_string; 
    $url = '.administration/user'; 
  }

  if (($params[0] eq 'edit' || $params[0] eq 'new' )  && !$error)
  { $url = '.administration/user-edit'; }

  my $edit_user = shift @{ $user_dbi->get({login=>$request->param("login"), count=>1}) };
  if ($edit_user && $params[0] eq 'new' && !$error)
  { $error = $user_exists_string; 
    $url = '.administration/user'; 
  }

  if (!$edit_user && ($params[0] eq 'save' || $params[0] eq 'edit' || $params[0] eq 'copy' || $params[0] eq 'remove')&& !$error)
  { $error = $user_notexists_string; 
    $url = '.administration/user'; 
  }

  if ($params[0] eq 'new'  && !$error && $request->method eq "POST")
  { $user_dbi->add(SPINE::Base::User->new({usergroup=>"users",login=>$request->param('login'), fullname=>$request->param('fullname')})); 
    $usergroup_dbi->add(SPINE::Base::Usergroup->new({usergroup=>"users",username=>$request->param('login')})); 
  }

  if ($params[0] eq 'save' && !$error && $request->method eq "POST")
  { save(); }

  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { remove(); }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }

  my $body = undef;
  $body = $content->body if ref $content;
  if ($url eq ".administration/user")
  { $content->title("User Administration"); }
  
  if ((!$params[0] || $params[0] eq 'remove' || $params[0] eq 'save')  || $error)
  { my @users = @{$user_dbi->get()};
    my $list = undef;
    for(@users)
    { my %hash = $_->tohash;
      $list .= qq(<div name="adminpanel" class="fullpanel"><form action="<?SPINE_Location?>admin/user/edit/" method="post">\n);
      $list .= qq(<input type="hidden" name="login" value="$hash{login}"><div class="panelcel" style="width: 20%">$hash{fullname}</div>\n);
      $list .= qq(<div class="panelcel" style="width: 20%">$hash{login}</div><div class="panelcel" style="width: 20%"><input type="submit" value="edit" class="button" name="action">\n);
      $list .= qq(</form>&nbsp;<form action="<?SPINE_Location?>admin/user/remove/" method="post"><input type="hidden" name="login" value="$hash{login}">\n);
      $list .= qq(<input type="submit" value="delete" class="button" name="action"></div></form></div><div class="spacercel"></div>\n);
    }
    if ($error) { $error = qq(<p class="error">$error</p>); }
    $body =~ s/\$userdata/$list/gmx;
    $body =~ s/\$error/$error/gmx;        
  } 
  if (($params[0] eq "edit" || $params[0] eq "save" || $params[0] eq "new")  && !$error)
  { my $user = shift @{ $user_dbi->get({login=>$request->param("login"), count=>1}) };
    my @usergroups =  @{ $usergroup_dbi->get({username=>$request->param("login")}) };
    my %hash = ();
    %hash = $user->tohash if ref $user;
    $body =~ s/\$error/$error/gmx;        
    $body =~ s/\$login/$hash{login}/gmx;  
    $body =~ s/\$name/$hash{fullname}/gmx;  
    $body =~ s/\$password//gmx;  
    $body =~ s/\$id/$hash{id}/gmx;  
    $body =~ s/\$email/$hash{email}/gmx;  
    @usergroups = map { $_ = $_->usergroup } @usergroups;
    my @adminaccess = ();
    for(@usergroups)
    { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_}) }); }
    my $usergroups = join(", ",@usergroups);
    $body =~ s/\$usergroups/$usergroups/gmx;      
    my $adminaccess = undef;
    my %permissions = ();
    for(@adminaccess) { $permissions{$_->section} = $permissions{$_->section} | $_->permissions; }
    #Add clean HTML here
    #ORing permissions works
    #TODO: Add Group & permissions
    for(keys %permissions) 
    { #$adminaccess .= qq(<input type="checkbox"
      $adminaccess .= $_."&nbsp;&nbsp;". $permissions{$_}."<br>"; }
    $body =~ s/\$permissions/$adminaccess/gmx;      
  }
  $content->body($body);
  return $content;
}

sub save
{ my $user = $user_dbi->get({id=>$request->param('id'), count=>1});
  $user->login($request->param('login')) if ref $user;
  $user->fullname($request->param('name')) if ref $user;
  $user->password(md5_hex($request->param('password'))) if ref $user;
  $user->email($request->param('email')) if ref $user;
  $user_dbi->update($user);
  return;
}

sub remove
{ my $user = shift @{$user_dbi->get({login=>$request->param('login'), count=>1})};
  $user_dbi->remove($user) if $user;
  return;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::User

=head1 DESCRIPTION

This is the Admin User Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.3 beta.

=head1 AUTHOR

Hendrik Van Belleghem - hendrik.vanbelleghem@gmail.com

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
