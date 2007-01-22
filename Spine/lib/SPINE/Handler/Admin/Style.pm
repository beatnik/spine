package SPINE::Handler::Admin::Style;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.40 $

use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Style;
use SPINE::DBI::Content;
use SPINE::DBI::Macro;
use SPINE::DBI::Session;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Attribute;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $style_dbi $user_dbi $macro_dbi $attribute_dbi $request $user $error $ierror $readperms $writeperms $execperms $adminaccess %i18n %default);
use vars qw($valid_perms_string $enter_name_string $create_style_string $remove_style_string $edit_style_string $save_style_string $copy_style_string $style_exists_string $style_notexists_string);

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

  my $page = $request->param('name');
  $error = '';
  $ierror = '';
  %i18n = ();
  %default = ();

  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//mx;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $style_dbi = SPINE::DBI::Style->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $macro_dbi = SPINE::DBI::Macro->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);
  my $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  my $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  my $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my @default_hash = ();
  @default_hash = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = ();
    %hash = %{$_} if $_;
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }

  my $lang = $default{'lang'} || "";
  $lang = ".$lang" if $lang;
  $lang = "" if $lang eq ".en";

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>"en")};
  for(@i18n_hash)
  { my %hash = ();
    %hash = %{$_} if $_;
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_style_string = $i18n{'create_style'} || "Create new style<br>";
  $remove_style_string = $i18n{'remove_style'} || "Remove style<br>";
  $edit_style_string = $i18n{'edit_style'} || "Edit style<br>";
  $save_style_string = $i18n{'save_style'} || "Save style<br>";
  $copy_style_string = $i18n{'copy_style'} || "Copy style<br>";
  $style_exists_string = $i18n{'style_exists'} || "This style already exists!<br>";
  $style_notexists_string = $i18n{'style_not_exists'} || "This style does not exist!<br>";
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'style'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;

  shift @params;
  if (!$params[0] || !$page || $page eq $enter_name_string)
  { $url = '.admin-general'; @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_style_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_style_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_style_string;
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_style_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = $valid_perms_string.$copy_style_string;
    $url = '.admin-general'; 
  }

  my $edit_style = shift @{$style_dbi->get({name=>$page}, count=>1)};
  if ($edit_style && $params[0] eq 'new' && !$error)
  { $error = $style_exists_string; 
    $url = '.admin-general'; 
  }

  if (!$edit_style && ($params[0] eq 'edit' || $params[0] eq 'copy' || $params[0] eq 'remove')&& !$error)
  { $error = $style_exists_string; 
    $url = '.admin-general'; 
  }
 
  if ($params[0] eq 'new' && !$error && $request->method eq "POST")
  { my $s = SPINE::Base::Style::default();
    $s->name($page); $s->owner($user);
    $style_dbi->add($s); 
    $url = '.admin-style'; 
  }

  if ($params[0] eq 'edit' && !$error)
  { $url = '.admin-style'; }
  
  if ($params[0] eq 'save' && !$error && $request->method eq "POST")
  { $url = '.admin-style'; 
    save();
  }

  if ($params[0] eq 'copy' && !$error && $request->method eq "POST")
  { $url = '.admin-general'; 
    copy();
  }

  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { $url = '.admin-general'; 
    remove();
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }

  my $style = shift @{$style_dbi->get({name=>$content->style, count=>1})};
  if (!ref $style)
  { $content = shift @{$content_dbi->get({name=>".404", count=>1})} || SPINE::Base::Content::default(); 
    my $body = $content->body;
    $body =~ s/\$page/$url/gmx;
    my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/mx;
    $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
    $body =~ s/\$serversig/$serversig/gmx;
    $content->body($body);
  }
  my $body = undef;
  $body = $content->body if ref $content;
  if ($url eq ".admin-general")
  { $content->title("Style Administration"); }

  if (($params[0] eq 'edit' || $params[0] eq 'save' || $params[0] eq 'new')  && !$error)
  { my $edit_style = shift @{$style_dbi->get({name=>$page, count=>1})};
    my $sbody = undef;
    $sbody = $edit_style->body if ref $edit_style;
    my @macros = @{$macro_dbi->getlist()};
    my $macrolist = undef;
    my $icomment = undef;
    $icomment = $edit_style->icomment if ref $edit_style;
    for(@macros) 
    { my $selected = $edit_style->macros eq $_ ? ' selected' : ''; 
      $macrolist .= "<option value=\"$_\"$selected>$_\n"; 
    }
    $sbody =~ s/\&/\&amp\;/gmx; 
    $sbody =~ s/\</\&lt\;/gmx;
    $sbody =~ s/\>/\&gt\;/gmx;
    $body =~ s/\$title/$edit_style->title/gmxe if ref $edit_style;
    $body =~ s/\$filename/$edit_style->name/gmxe if ref $edit_style;
    $body =~ s/\$size/length($sbody)/gmxe;
    $body =~ s/\$macros/$macrolist/gmx;
    $body =~ s/\$owner/$edit_style->owner/gmxe if ref $edit_style; 
    $body =~ s/\$lastmod/$edit_style->modified/gmxe if ref $edit_style;
    my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
    my $group = undef;
    for(@groups) { my $sel = $edit_style->usergroup eq $_ ? ' selected' : ''; next if !$_; $group .= qq(<option$sel>$_); }
    my @perms = $edit_style->permissions =~ /^(\d)(\d)(\d)(\d)/mx;
    my @checked = (""," checked");
    my $gpermissions = qq(Read: <input type="checkbox" name="groupr" value="1"$checked[$perms[0]]>);
    $gpermissions .= qq(Write: <input type="checkbox" name="groupw" value="1"$checked[$perms[1]]>);
    my $wpermissions = qq(Read: <input type="checkbox" name="worldr" value="1"$checked[$perms[2]]>);
    $wpermissions .= qq(Write: <input type="checkbox" name="worldw" value="1"$checked[$perms[3]]>);
    $body =~ s/\$group/$group/gmx;
    $body =~ s/\$lastmod/$edit_style->modified/gmxe if ref $edit_style;
    $body =~ s/\$size/length($sbody)/gmxe;
    $body =~ s/\$icomment/$icomment/gmx;
    $body =~ s/\$gpermissions/$gpermissions/gmx;
    $body =~ s/\$wpermissions/$wpermissions/gmx;
    $body =~ s/\$error/$ierror/gmx;
    $body =~ s/\$body/$sbody/gmx;
  } 

  if ( ((!$params[0] || $params[0] eq 'copy' || $params[0] eq 'remove') && $params[0] ne 'edit' ) || $error)
  { my @li = @{$style_dbi->get()};
    my $c = undef;
    my @list = ();
    #Only show hidden files in the listing if you are admin
    #Comment these 2 lines if you wish to include the dot-files in the listing..
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
            $readwperms) || #Style is world readable
            (@groups && $readgperms) #Style is group readable and user is part of group
         )
       { push(@list,$c->name); next; }
    }  
    my $list = undef;
    for(@list) { $list .= "<option value=\"$_\">$_\n"; }
    $body =~ s/\$list/$list/gmx;
    $body =~ s/\$type/style/gmx;
    $body =~ s/\$label/style/gmx;
    $body =~ s/\$error/$error/gmx;    
  } 
  $content->body($body);
  return $content;
}

sub save
{ my $style = shift @{$style_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $style->owner eq $user || 
      $style->permissions =~ /^\d1/mx || $style->permissions =~ /\d1$/mx)
  { $style->title($request->param('title')) if ref $style;
    $style->body($request->param('body')) if ref $style;
    $style->macros($request->param('macros')) if ref $style;
    $style->usergroup($request->param('usergroup')) if ref $style;
    my $permissions = scalar $request->param('groupr') ? "1" : 0;
    $permissions .= scalar $request->param('groupw') ? "1" : 0;
    $permissions .= scalar $request->param('worldr') ? "1" : 0;
    $permissions .= scalar $request->param('worldw') ? "1" : 0;
    $style->permissions($permissions) if ref $style;
    $style->icomment($request->param('icomment')) if ref $style;
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $style->modified("$year-$mon-$day $hour:$min:$sec") if ref $style;
    $style_dbi->update($style);
  }
  else
  { $ierror = $valid_perms_string.$save_style_string; }
  return;
}

sub copy
{ my $style = shift @{$style_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $style->owner eq $user || 
      $style->permissions =~ /^1/mx || $style->permissions =~ /1\d$/mx)
  { $style->name($request->param('target'));
    $style->id(0);
    $style_dbi->add($style);
  }
  return;
}

sub remove #Document: You need both read and write permissions to delete a style
{ my $style = shift @{$style_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $style->owner eq $user || 
      $style->permissions =~ /^\11/mx || $style->permissions =~ /11$/mx)  
  { $style_dbi->remove($style); }
  return;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Style

=head1 DESCRIPTION

This is the Style Admin Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.22.

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
