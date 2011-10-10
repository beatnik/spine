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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.227 $

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Macro;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Attribute;
use SPINE::DBI::Content;
use SPINE::Constant;
use Data::Dumper;
use strict;

use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $user_dbi $macro_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms %i18n %default $attribute_dbi);
use vars qw($valid_perms_string $enter_name_string $create_macroset_string $create_macro_string $remove_macroset_string $remove_macro_string $edit_macroset_string $save_macro_string $copy_macroset_string $macroset_exists_string $macroset_notexists_string);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  SPINE::Transparent::Constant->new($request);
  my %cookies = $request->cookies;
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
  
  $url = '.administration/general'; 
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
  $create_macroset_string = $i18n{'create_macroset'} || "Add a new macroset";
  $create_macro_string = $i18n{'create_macro'} || "Add a new macro";
  $remove_macroset_string = $i18n{'remove_macroset'} || "Remove a macroset";
  $remove_macroset_string = $i18n{'remove_macro'} || "Remove a macro";
  $edit_macroset_string = $i18n{'edit_macroset'} || "Edit a macroset";
  $save_macro_string = $i18n{'save_macro'} || "Save a macro";
  $copy_macroset_string = $i18n{'copy_macroset'} || "Copy a macroset";
  $macroset_exists_string = $i18n{'macroset_exists'} || "This macroset already exists!";
  $macroset_notexists_string = $i18n{'macroset_not_exists'} || "This macroset does not exist!";
  
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
  { $url = '.administration/general'; @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_macroset_string;
    $url = '.administration/general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_macroset_string;
    $url = '.administration/general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_macroset_string;
    $url = '.administration/general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_macro_string;
    $url = '.administration/general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = $valid_perms_string.$copy_macroset_string;
    $url = '.administration/general'; 
  }
  if ($params[0] eq 'new' && !$error && $request->param("action") eq "save" && $request->param("key") && $request->param("name") && $request->method eq "POST")
  { save();
    $url = '.administration/macro';
    $params[0] = "edit";
  }

  if ($request->param('name') && ($params[0] eq 'edit' || $params[0] eq 'new' || ($params[0] eq 'remove' && $request->param('id') ) ) )
  { $url = '.administration/macro'; }

  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { remove();
    $url = '.administration/general' if (!$request->param('id'));
  }

  if ($params[0] eq 'copy' && !$error && $request->method eq "POST")
  { $url = '.administration/general'; 
    copy();
  }
  
  my $edit_macro = shift @{$macro_dbi->get({name=>$request->param('name')}, count=>1)};
  if ($edit_macro && $params[0] eq 'new' && !$error && !$request->param('action'))
  { $error = $macroset_exists_string; 
    $url = '.administration/general'; 
  }
 
  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }
  
  if ($params[0] eq 'new' && $request->param("action") eq "create" && $request->param("key") && $request->param("name") && !$error && $request->method eq "POST")
  { $macro_dbi->add(SPINE::Base::Macro->new({name=>$request->param('name'), macrokey=>$request->param('key'), macrovalue=>$request->param('value')})); }

  my $body = undef;
  $body = $content->body if ref $content;
  if ($url eq ".administration/general")
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
 
      $list .=<<EOF;
         <div name="adminpanel" class="_spine_fullpanel">
            <div style="float:left;width:412px;">
            <form action="<?SPINE_Location?>admin/macro/new" method="post">
            <input type="hidden" name="action" value="save" />
            <input type="hidden" name="name" value="$hash{'name'}" />
            <input type="hidden" name="id"   value="$hash{'id'}"  />
            <div class="_spine_panelcel" style="width:195px">
                 <input type="text" class="_spine_input" name="key" 
                      value="$hash{'macrokey'}" 
                      size="30" /></div>
            <div class="_spine_panelcel" style="width:195px">
                 <input type="text" class="_spine_input" name="value" 
                    value="$hash{'macrovalue'}" 
                    size="30"/></div>
            <div class="_spine_panelcel" style="width:10px;background-color:orange;">
                 <input type="image" src="/images/save.png" alt="Save" name="action" style="padding:0px" />
                 </form></div>
            </div>
            <div style="float:left;width:50px">
            <form action="<?SPINE_Location?>admin/macro/remove/" 
                  method="post">
                 <input type="hidden" name="name" value="$hash{'name'}" />
                 <input type="hidden" name="id"   value="$hash{'id'}"   />
                 <div class="_spine_panelcel" style="width:10px;background-color:pink;">
                 <input type="image" src="/images/delete.png" alt="Delete"
                          name="action" style="padding:0px" /></div>
            </form>
            </div>
            <div class="_spine_spacercel"></div>
         </div><!-- adminpanel -->

EOF

    }
    $body =~ s/\$name/$request->param('name')/gmxe;
    $body =~ s/\$list/$list/gmx;
  } 
  if ( ( (!$params[0] || $params[0] eq 'copy' || ($params[0] eq 'remove' && !$request->param('id') ) ) && $params[0] ne 'edit' ) || $error )
  { my @list = @{$macro_dbi->getlist()};
    my $list = "";
    my $c = undef;
    for(@list) { $list .= qq(<option value="$_">$_\n); }
    if ($error) { $error = qq(<p class="error">$error</p>); }
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
