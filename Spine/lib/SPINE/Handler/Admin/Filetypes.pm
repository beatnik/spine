package SPINE::Handler::Admin::Filetypes;

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

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms $attribute_dbi %i18n %default);
use vars qw($valid_perms_string $enter_name_string $create_filetype_string $remove_filetype_string $save_filetype_string $filetype_exists_string $filetype_notexists_string $ierror $lang);

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
  $error = '';
  $ierror = '';
  %default = ();
  %i18n = ();
  
  $url =~ s/^$location\/?//mx;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  $url = '.administration/filetypes'; 

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = ();
    if ($_)
    { %hash = %{$_}; }
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>$lang)};
  for(@i18n_hash)
  { my %hash = ();
    if ($_)
    { %hash = %{$_}; }
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_filetype_string = $i18n{'create_filetype'} || "Add new filetype association";
  $remove_filetype_string = $i18n{'remove_filetype'} || "Remove filetype association";
  $save_filetype_string = $i18n{'save_filetype'} || "Save filetype association";
  $filetype_exists_string = $i18n{'filetype_exists'} || "This filetype association already exists!";
  $filetype_notexists_string = $i18n{'filetype_not_exists'} || "This filetype association does not exist!";
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'adminaccess'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;
  
  shift @params;

  $error = "";

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_filetype_string;    
    $url = '.administration/filetypes'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_filetype_string;
    $url = '.administration/filetypes'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_filetype_string;
    $url = '.administration/filetypes'; 
  }

  if (($params[0] eq 'save')  && !$error && $request->method eq "POST")
  { save();
    $url = '.administration/filetypes';
  }

  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { remove();
  }

  my $edit_attribute = shift @{$attribute_dbi->get({section=>"mimetype", name=>"content", attr=>$request->param('attr'), value=>$request->param('value')}, count=>1)};
  if ($edit_attribute && $params[0] eq 'new' && !$error)
  { $error = $filetype_exists_string;
    $url = '.administration/filetypes'; 
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return (SPINE::Base::Content::default(),$SPINE::Transparent::Constant::NOT_FOUND); }

  if ($params[0] eq 'new' && $request->param("attr") && $request->param("value") && $request->method eq "POST" && !$error)
  { $attribute_dbi->add(SPINE::Base::Attribute->new({section=>"mimetype", name=>"content", attr=>$request->param('attr'), value=>$request->param('value')}));
  }

  my $body = undef;
  if (ref $content)
  { $body = $content->body; }
  if ($url eq ".administration/general")
  { $content->title("File Types"); }

  my @filetypes = @{$attribute_dbi->get({section=>"mimetype", name=>"content"})};
  my $list = undef;
  $list .= qq(<div name="adminpanel" class="fullpanel"><form action="<?SPINE_Location?>admin/filetypes/new/" method="post">\n);
  $list .= qq(<div class="panelcel" style="width: 10%"><input type="text" name="attr" class="input" value="extension" size="15">\n</div>);
  $list .= qq(<div class="panelcel" style="width: 20%"><input type="text" name="value" class="input" value="mime/type" size="30">\n</div>);
  $list .= qq(<div class="panelcel" style="width: 20%"><input type="submit" value="Create" class="button" name="action"></div>\n</form><div class="spacercel"></div></div>\n); 
  for(@filetypes)
  { my %hash = $_->tohash;
    $list .= qq(<div name="adminpanel" class="fullpanel"><form action="<?SPINE_Location?>admin/filetypes/save/" method="post">);
    $list .= qq(<input type="hidden" name="id" value="$hash{id}">\n);
    $list .= qq(<div class="panelcel" style="width: 10%"><input type="text" name="attr" class="input" value="$hash{attr}" size="15">\n</div>);
    $list .= qq(<div class="panelcel" style="width: 20%"><input type="text" name="value" class="input" value="$hash{value}" size="30">\n</div>);
    $list .= qq(<div class="panelcel" style="width: 20%"><input type="submit" value="Save" class="button" name="action">\n</form><form action="<?SPINE_Location?>admin/filetypes/remove/" method="post">);
    $list .= qq(<input type="hidden" name="id" value="$hash{id}">\n<input type="submit" value="Delete" class="button" name="action"></div\n</form><div class="spacercel"></div></div>\n);     
  }
  $body =~ s/\$list/$list/gmx;
  if ($error) { $error = qq(<p class="error">$error</p>); }
  $body =~ s/\$error/$error/gmx;
  $content->body($body);
  return $content;
}

sub save
{ my $attribute = $attribute_dbi->get({id=>$request->param('id'), count=>1});
  $attribute->value($request->param('value')) if ref $attribute;
  $attribute->attr($request->param('attr')) if ref $attribute;
  $attribute_dbi->update($attribute) if $attribute;
  return;
}

sub remove
{ my $attribute = $attribute_dbi->get({id=>$request->param('id'), count=>1});
  $attribute_dbi->remove($attribute) if $attribute;
  return;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Filetypes

=head1 DESCRIPTION

This is the Filetype association Handler for SPINE.

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
