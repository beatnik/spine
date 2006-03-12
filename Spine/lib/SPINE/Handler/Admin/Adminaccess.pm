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
use SPINE::DBI::Content;
use SPINE::Constant;

use Data::Dumper;

use strict;

use Apache::Cookie;

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  my %cookies = Apache::Cookie->fetch;
  my $url = $request->uri;
  my $location = $request->location;
  
  $url =~ s/^$location\/?//;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $url = '.admin-access'; 

  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;
  
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
  { $error = 'You do not have valid permissions for this operation : Defining new Administration Access<br>'; 
    $url = '.admin-access'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = 'You do not have valid permissions for this operation : Remove Administration Access<br>'; 
    $url = '.admin-access'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = 'You do not have valid permissions for this operation : Save Administration Access<br>'; 
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
  { $error = 'This Administration Access set already exists!<br>'; 
    $url = '.admin-access'; 
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { $content = shift @{$content_dbi->get({name=>".404", count=>1})} || SPINE::Base::Content::default(); 
      my $body = $content->body;
      $body =~ s/\$page/$url/g;
      my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/;
      $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
      $body =~ s/\$serversig/$serversig/g;
      $content->body($body);
    }

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
