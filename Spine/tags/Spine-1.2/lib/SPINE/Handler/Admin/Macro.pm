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
use SPINE::DBI::Attribute;
use SPINE::DBI::Content;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $user_dbi $macro_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms %i18n %default $attribute_dbi);
use vars qw($valid_perms_string $enter_name_string $create_macroset_string $create_macro_string $remove_macroset_string $remove_macro_string $edit_macroset_string $save_macro_string $copy_macroset_string $macroset_exists_string $macroset_notexists_string);

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
  %default = ();
  %i18n = ();
  
  $url =~ s/^$location\/?//mx;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $macro_dbi = SPINE::DBI::Macro->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  
  $url = '.admin-general'; 
  $error = "";
  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = ();
    %hash = %{$_} if $_;
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }

  my $lang = $default{'lang'} || "";
  $lang = ".$lang" if $lang;
  $lang = "" if $lang eq ".en";

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>$lang)};
  for(@i18n_hash)
  { my %hash = ();
    %hash =  %{$_} if $_;
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_macroset_string = $i18n{'create_macroset'} || "Add a new macroset<br>";
  $create_macro_string = $i18n{'create_macro'} || "Add a new macro<br>";
  $remove_macroset_string = $i18n{'remove_macroset'} || "Remove a macroset<br>";
  $remove_macroset_string = $i18n{'remove_macro'} || "Remove a macro<br>";
  $edit_macroset_string = $i18n{'edit_macroset'} || "Edit a macroset<br>";
  $save_macro_string = $i18n{'save_macro'} || "Save a macro<br>";
  $copy_macroset_string = $i18n{'copy_macroset'} || "Copy a macroset<br>";
  $macroset_exists_string = $i18n{'macroset_exists'} || "This macroset already exists!<br>";
  $macroset_notexists_string = $i18n{'macroset_not_exists'} || "This macroset does not exist!<br>";
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'macros'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;

  shift @params;
  #@params is something like qw(content new);
  #And we already know it's in content so discard first element
  if (!$params[0] || !$request->param('name') || $request->param('name') eq $enter_name_string)
  { $url = '.admin-general'; @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_macroset_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_macroset_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_macroset_string;
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_macro_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = $valid_perms_string.$copy_macroset_string;
    $url = '.admin-general'; 
  }

  if (($params[0] eq 'save')  && !$error && $request->method eq "POST")
  { save();
    $url = '.admin-macro';
    $params[0] = "edit";
  }

  if ($request->param('name') && ($params[0] eq 'edit' || $params[0] eq 'new' || ($params[0] eq 'remove' && $request->param('id') ) ) )
  { $url = '.admin-macro'; }

  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { remove();
    $url = '.admin-general' if (!$request->param('id'));
  }

  if ($params[0] eq 'copy' && !$error && $request->method eq "POST")
  { $url = '.admin-general'; 
    copy();
  }
  my $edit_macro = shift @{$macro_dbi->get({name=>$request->param('name')}, count=>1)};
  if ($edit_macro && $params[0] eq 'new' && !$error)
  { $error = $macroset_exists_string; 
    $url = '.admin-general'; 
  }
 
  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }
  
  if ($params[0] eq 'new' && $request->param("key") && $request->param("name") && !$error && $request->method eq "POST")
  { $macro_dbi->add(SPINE::Base::Macro->new({name=>$request->param('name'), macrokey=>$request->param('key'), macrovalue=>$request->param('value')})); }

  my $body = undef;
  $body = $content->body if ref $content;
  if ($url eq ".admin-general")
  { $content->title("Macro Administration"); }

  if ($request->param('name') && ($params[0] eq 'edit' || $params[0] eq 'new' || ($params[0] eq 'remove' && $request->param('id') ) ) && !$error )
  { my @macro = @{$macro_dbi->get({name=>$request->param('name')})};
    my $list = undef;
    for(@macro)
    { my %hash = $_->tohash;
      $hash{macrokey} =~ s/</&lt;/gmx;
      $hash{macrokey} =~ s/>/&gt;/gmx;
      $hash{macrokey} =~ s/\"/&quot;/gmx;
      $hash{macrovalue} =~ s/</&lt;/gmx;
      $hash{macrovalue} =~ s/>/&gt;/gmx;
      $hash{macrovalue} =~ s/\"/&quot;/gmx;
      $list .= qq(<tr bgcolor="#ffffff"><form action="<?SPINE_Location?>admin/macro/save/" method="post"><input type="hidden" name="name" value="$hash{name}"><input type="hidden" name="id" value="$hash{id}">\n<td><input type="text" name="key" class="input" value="$hash{macrokey}" size="30">\n</td><td><input type="text" name="value" class="input" value="$hash{macrovalue}" size="30">\n</td>\n<td><input type="submit" value="save" class="button" name="action"></td>\n</form><form action="<?SPINE_Location?>admin/macro/remove/" method="post"><input type="hidden" name="name" value="$hash{name}"><input type="hidden" name="id" value="$hash{id}">\n<td><input type="submit" value="delete" class="button" name="action"></td>\n</form></tr>\n); 
    }
    $body =~ s/\$name/$request->param('name')/gmxe;
    $body =~ s/\$list/$list/gmx;
  } 
  if ( ( (!$params[0] || $params[0] eq 'copy' || ($params[0] eq 'remove' && !$request->param('id') ) ) && $params[0] ne 'edit' ) || $error )
  { my @list = @{$macro_dbi->getlist()};
    my $list = "";
    my $c = undef;
    for(@list) { $list .= qq(<option value="$_">$_\n); }
    $body =~ s/\$list/$list/gmx;
    $body =~ s/\$type/macro/gmx;
    $body =~ s/\$label/macro/gmx;
    $body =~ s/\$error/$error/gmx;
  } 
  $content->body($body);
  return $content;
}

sub save
{ my $macro = $macro_dbi->get({name=>$request->param('name'), id=>$request->param('id'), count=>1});
  $macro->macrovalue($request->param('value')) if ref $macro;
  $macro->macrokey($request->param('key')) if ref $macro;
  $macro_dbi->update($macro) if $macro;
  return;
}

sub remove
{ my @param = (); 
  if ($request->param('id')) 
  { @param = ("id",scalar($request->param('id'))); 
    my $macro = $macro_dbi->get({name=>$request->param('name'), @param, count=>1});
    $macro_dbi->remove($macro) if $macro;
  } else
  { my $macro = shift @{ $macro_dbi->get({name=>$request->param('name'), count=>1}) };
    $macro_dbi->remove($macro) if $macro;
  }
  return;
}

sub copy
{ my @macros = @{ $macro_dbi->get({name=>$request->param('name')}) } ;
  for my $macro (@macros)
  { $macro->name($request->param('target'));
    $macro_dbi->add($macro);
  }
  return;
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

This is spine 1.2.

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
