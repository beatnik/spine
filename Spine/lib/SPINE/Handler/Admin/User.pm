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

use warnings;

use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::DBI::Session;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Constant;
use SPINE::Transparent::Request;
use Digest::MD5 qw(md5_hex);

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $adminaccess_dbi $session_dbi $request $readperms $writeperms $execperms $user $adminaccess $error);

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
  
  $url =~ s/^$location\/?//;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);  
  $url = '.admin-user'; 
  
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

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;
  
  shift @params;

  if ($params[0] eq 'new' && !$execperms)
  { $error = 'You do not have valid permissions for this operation : Adding new users<br>'; 
    $url = '.admin-user'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = 'You do not have valid permissions for this operation : Removing users<br>'; 
    $url = '.admin-user'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = 'You do not have valid permissions for this operation : Editing users<br>'; 
    $url = '.admin-user'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = 'You do not have valid permissions for this operation : Saving users<br>'; 
    $url = '.admin-user'; 
  }

  if (($params[0] eq 'edit' || $params[0] eq 'new' )  && !$error)
  { $url = '.admin-user-edit'; }

  my $edit_user = shift @{ $user_dbi->get({login=>$request->param("login"), count=>1}) };
  if ($edit_user && $params[0] eq 'new' && !$error)
  { $error = 'This User already exists!<br>'; 
    $url = '.admin-general'; 
  }

  if (!$edit_user && ($params[0] eq 'save' || $params[0] eq 'edit' || $params[0] eq 'copy' || $params[0] eq 'remove')&& !$error)
  { $error = 'This User set does not exist!<br>'; 
    $url = '.admin-general'; 
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
  
  if ((!$params[0] || $params[0] eq 'remove' || $params[0] eq 'save')  || $error)
  { my @users = @{$user_dbi->get()};
    my $list = undef;
    for(@users)
    { my %hash = $_->tohash;
      $list .= qq(<tr bgcolor="#ffffff"><form action="<?SPINE_Location?>admin/user/edit/" method="post"><input type="hidden" name="login" value="$hash{login}">\n<td>$hash{fullname}</td>\n<td>$hash{login}</td>\n<td><input type="submit" value="edit" class="button" name="action"></td>\n</form><form action="<?SPINE_Location?>admin/user/remove/" method="post"><input type="hidden" name="login" value="$hash{login}">\n<td><input type="submit" value="delete" class="button" name="action"></td>\n</form><td>&nbsp;</td></tr>\n); 
    }
    $body =~ s/\$userdata/$list/g;
    $body =~ s/\$error/$error/g;        
  } 
  if (($params[0] eq "edit" || $params[0] eq "save" || $params[0] eq "new")  && !$error)
  { my $user = shift @{ $user_dbi->get({login=>$request->param("login"), count=>1}) };
    my @usergroups =  @{ $usergroup_dbi->get({username=>$request->param("login")}) };
    my %hash = ();
    %hash = $user->tohash if ref $user;
    $body =~ s/\$error/$error/g;        
    $body =~ s/\$login/$hash{login}/g;  
    $body =~ s/\$name/$hash{fullname}/g;  
    $body =~ s/\$password//g;  
    $body =~ s/\$id/$hash{id}/g;  
    $body =~ s/\$email/$hash{email}/g;  
    @usergroups = map { $_ = $_->usergroup } @usergroups;
    my @adminaccess = ();
    for(@usergroups)
    { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_}) }); }
    my $usergroups = join(", ",@usergroups);
    $body =~ s/\$usergroups/$usergroups/g;      
    my $adminaccess = undef;
    my %permissions = ();
    for(@adminaccess) { $permissions{$_->section} = $permissions{$_->section} | $_->permissions; }
    #Add clean HTML here
    #ORing permissions works
    #TODO: Add Group & permissions
    for(keys %permissions) 
    { #$adminaccess .= qq(<input type="checkbox"
      $adminaccess .= $_."&nbsp;&nbsp;". $permissions{$_}."<br>"; }
    $body =~ s/\$permissions/$adminaccess/g;      
  }
  $content->body($body);
  return $content;
}

sub save
{ my $user = shift @{$user_dbi->get({id=>$request->param('id'), count=>1})};
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
