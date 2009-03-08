package SPINE::Handler::Admin::Tools;

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

use strict;

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::DBI::Attribute;
use SPINE::Base::Attribute;
use SPINE::Constant;

use Data::Dumper;

use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $attribute_dbi $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $ierror $readperms $writeperms $execperms);
use vars qw($valid_perms_string $enter_name_string $create_content_string $remove_content_string $edit_content_string $save_content_string $copy_content_string $content_exists_string $content_notexists_string);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  my %default = ();
  my %i18n = ();

  SPINE::Transparent::Constant->new($request);
  my %cookies = $request->cookies;
  my $url = $request->uri;
  my $location = $request->location;

  $url =~ s/^$location\/?//mx;
  ($url,@params) = split("/",$url);

  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  my $body = qq(<form method="post" action="<?SPINE_Location?>admin/cache/clear/"><input type="submit" class="button" value="Clear Cache"></form>);
  
  # This part catches the image as button bug in IE.
  shift @params;
  my $action = shift @params || "rename";
  
  $content_dbi = SPINE::DBI::Content->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $user = "admin";
  $user = $session->username if $session;

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user, count=>1}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'content'}) }); }
  my %permissions = ();
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
  
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $content_notexists_string = $i18n{'content_not_exists'} || "This content does not exist!";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  my $destination = scalar($request->param("destname"));
  if ($request->method eq "POST" && $action eq "rename" && $destination ne $enter_name_string)
  { my $source = shift @{$content_dbi->get({name=>$request->param('content'), count=>1})};
    $ierror = $content_notexists_string if !$source;
    if ($user eq 'admin' || $source->owner eq $user || 
       $source->permissions =~ /^\d1/mx || $source->permissions =~ /\d1$/mx)
    { $source->name($destination);
      $content_dbi->update($source,1);
    } else
    { $ierror = $valid_perms_string.$save_content_string; }
  }

  $body = qq(<div id="menu"><?SPINE_Navbar("admin_tool")?></div>);
  my @li = @{$content_dbi->get()}; 
  my $list = undef;
  my $c = undef;
  my @list = ();
  my @full_list = ();
  if ($user ne 'admin')
  { @li = grep { $_->name =~ /^[^\.]/mx } @li; }
    
  for my $c (@li)
  { my $readgperms = $c->permissions & READGPERMISSIONS;
    $readgperms =~ s/0//gmx;
    my $readwperms = $c->permissions & READWPERMISSIONS;
    $readwperms =~ s/0//gmx;
    my @groups = grep { $_ eq $c->usergroup } @usergroups;
    if ( ($user eq 'admin' || #User is admin
          $c->owner eq $user || #User is owner of content
          $readwperms) || #Content is world readable
          (@groups && $readgperms) #Content is group readable and user is part of group
         )
      { push(@list,$c->name); push(@full_list,$c); next; }
  }

  for(@list) { $list .= qq(<option value="$_">$_\n); }

  if ($action eq "rename")
  { for(@list) { $list .= qq(<option value="$_">$_\n); }
    $body .= <<EOF;
<form method="post" action="<?SPINE_Location?>admin/tools/rename/">
<input type="submit" value="Rename" class="button">&nbsp;<select name="content" class="general">$list</select> to <input type="text" class="input" name="destname" value="$enter_name_string">
</form>  
EOF

  }

  if ($action eq "listlog")
  { for my $c (@full_list)
    { $body .= $c->name if $c->logging;
    }
  }
  
  my $c = SPINE::Base::Content->new({body=>$body,style=>".admin"});
  return $c;
}
1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Tools

=head1 DESCRIPTION

This is the Tools Admin Handler for SPINE.

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
