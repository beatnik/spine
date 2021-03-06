package SPINE::Handler::Admin::Macro;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.27 $

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Macro;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $user_dbi $macro_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms);

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
  $macro_dbi = SPINE::DBI::Macro->new($dbh);
  $url = '.admin-general'; 
  $error = "";
  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'macros'}) }); }
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
  { $error = 'You do not have valid permissions for this operation : Creating new macros<br>'; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = 'You do not have valid permissions for this operation : Remove macros<br>'; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = 'You do not have valid permissions for this operation : Edit macros<br>'; 
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = 'You do not have valid permissions for this operation : Save macros<br>'; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = 'You do not have valid permissions for this operation : Copying macros<br>'; 
    $url = '.admin-general'; 
  }

  if (($params[0] eq 'save')  && !$error)
  { save(); 
    $url = '.admin-macro';
    $params[0] = "edit";
  }

  if ($request->param('name') && ($params[0] eq 'edit' || $params[0] eq 'new' || ($params[0] eq 'remove' && $request->param('id') ) ) )
  { $url = '.admin-macro'; }

  if ($params[0] eq 'remove' && !$error)
  { remove(); 
    $url = '.admin-general' if (!$request->param('id'));
  }

  if ($params[0] eq 'copy' && !$error)
  { $url = '.admin-general'; 
    copy(); 
  }

  my $edit_macro = shift @{$macro_dbi->get({name=>$request->param('name')}, count=>1)};
  if ($edit_macro && $params[0] eq 'new' && !$error)
  { $error = 'This Macro set already exists!<br>'; 
    $url = '.admin-general'; 
  }
 
  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }
  
  if ($params[0] eq 'new' && $request->param("key") && $request->param("name") && !$error)
  { $macro_dbi->add(SPINE::Base::Macro->new({name=>$request->param('name'), macrokey=>$request->param('key'), macrovalue=>$request->param('value')})); }

  my $body = $content->body if ref $content;
  if ($request->param('name') && ($params[0] eq 'edit' || $params[0] eq 'new' || ($params[0] eq 'remove' && $request->param('id') ) ) && !$error )
  { my @macro = @{$macro_dbi->get({name=>$request->param('name')})};
    my $list = undef;
    for(@macro)
    { my %hash = $_->tohash;
      $hash{macrokey} =~ s/</&lt;/g;
      $hash{macrokey} =~ s/>/&gt;/g;
      $hash{macrokey} =~ s/\"/&quot;/g;
      $hash{macrovalue} =~ s/</&lt;/g;
      $hash{macrovalue} =~ s/>/&gt;/g;
      $hash{macrovalue} =~ s/\"/&quot;/g;
      $list .= qq(<tr bgcolor="#ffffff"><form action="<?SPINE_Location?>admin/macro/save/" method="post"><input type="hidden" name="name" value="$hash{name}"><input type="hidden" name="id" value="$hash{id}">\n<td><input type="text" name="key" class="input" value="$hash{macrokey}" size="30">\n</td><td><input type="text" name="value" class="input" value="$hash{macrovalue}" size="30">\n</td>\n<td><input type="submit" value="save" class="button" name="action"></td>\n</form><form action="<?SPINE_Location?>admin/macro/remove/" method="post"><input type="hidden" name="name" value="$hash{name}"><input type="hidden" name="id" value="$hash{id}">\n<td><input type="submit" value="delete" class="button" name="action"></td>\n</form></tr>\n); 
    }
    $body =~ s/\$name/$request->param('name')/ge;
    $body =~ s/\$list/$list/g;
  } 
  if ( ( (!$params[0] || $params[0] eq 'copy' || ($params[0] eq 'remove' && !$request->param('id') ) ) && $params[0] ne 'edit' ) || $error )
  { my @list = @{$macro_dbi->getlist()};
    my $list = "";
    my $c = undef;
    for(@list) { $list .= qq(<option value="$_">$_\n); }
    $body =~ s/\$list/$list/g;
    $body =~ s/\$type/macro/g;
    $body =~ s/\$label/macro/g;
    $body =~ s/\$error/$error/g;
  } 
  $content->body($body);
  return $content;
}

sub save
{ my $macro = shift @{$macro_dbi->get({name=>$request->param('name'), id=>$request->param('id'), count=>1})};
  $macro->macrovalue($request->param('value')) if ref $macro;
  $macro->macrokey($request->param('key')) if ref $macro;
  $macro_dbi->update($macro) if $macro;
}

sub remove
{ my @param = (); 
  if ($request->param('id')) { @param = ("id",scalar($request->param('id'))); }
  my $macro = shift @{$macro_dbi->get({name=>$request->param('name'), @param, count=>1})};
  $macro_dbi->delete($macro) if $macro;
}

sub copy
{ my @macros = @{ $macro_dbi->get({name=>$request->param('name')}) } ;
  for my $macro (@macros)
  { $macro->name($request->param('target'));
    $macro_dbi->add($macro);
  }
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Macro

=head1 DESCRIPTION

This is the Admin Macro Handler for SPINE.

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
