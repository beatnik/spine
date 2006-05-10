package SPINE::Handler::Admin::Content;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.54 $

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

#Apache::Request Handler
#DB Handler

use vars qw($VERSION $content_dbi $style_dbi $user_dbi $usergroup_dbi $macro_dbi $adminaccess_dbi $session_dbi $attribute_dbi $request $user $adminaccess $error $ierror $readperms $writeperms $execperms %i18n %default);
use vars qw($valid_perms_string $enter_name_string $create_content_string $remove_content_string $edit_content_string $save_content_string $copy_content_string $content_exists_string $content_notexists_string);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;
  my $page = $request->param('name');
  my $url = $request->uri;
  my $location = $request->location;
  $error = '';
  $ierror = '';
  %default = ();
  %i18n = ();
  $url =~ s/^$location\/?//;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $style_dbi = SPINE::DBI::Style->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $macro_dbi = SPINE::DBI::Macro->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>"en")};
  for(@i18n_hash)
  { my %hash = %{$_} if $_;
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_content_string = $i18n{'create_content'} || "Creating new content<br>";
  $remove_content_string = $i18n{'remove_content'} || "Remove content<br>";
  $edit_content_string = $i18n{'edit_content'} || "Edit content<br>";
  $save_content_string = $i18n{'save_content'} || "Save content<br>";
  $copy_content_string = $i18n{'copy_content'} || "Copy content<br>";
  $content_exists_string = $i18n{'content_exists'} || "This Content already exists!<br>";
  $content_notexists_string = $i18n{'content_not_exists'} || "This Content does not exist!<br>";
  
  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = %{$_} if $_;
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user, count=>1}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'content'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;

  shift @params;
  #@params is something like qw(content new);
  #And we already know it's in content so discard first element
  if (!$params[0] || !$page || $page eq $enter_name_string)
  { $url = '.admin-general'; @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_content_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_content_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_content_string; 
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_content_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = $valid_perms_string.$copy_content_string; 
    $url = '.admin-general'; 
  }

  my $edit_content = shift @{$content_dbi->get({name=>$page}, count=>1)};
  if ($edit_content && $params[0] eq 'new' && !$error)
  { $error = $content_exists_string; 
    $url = '.admin-general'; 
  }

  if (!$edit_content && ($params[0] eq 'save' || $params[0] eq 'edit' || $params[0] eq 'copy' || $params[0] eq 'remove')&& !$error)
  { $error = $content_notexists_string; 
    $url = '.admin-general'; 
  }

  my $lang = $default{'lang'} || "";
  $lang = ".$lang" if $lang;
  $lang = "" if $lang eq ".en";

  if ($params[0] eq 'new' && !$error)
  { my $c = SPINE::Base::Content::default(); 
    $c->name($page); $c->owner($user);
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $c->modified("$year-$mon-$day $hour:$min:$sec") if ref $c;
    $content_dbi->add($c);
    $url = '.admin-content'.$lang; 
  }

  if ($params[0] eq 'edit' && !$error)
  { $url = '.admin-content'.$lang; }
  
  if ($params[0] eq 'save' && !$error)
  { $url = '.admin-content'.$lang; 
    save();
  }

  if ($params[0] eq 'copy' && !$error)
  { $url = '.admin-general'.$lang;
    copy();
  }

  if ($params[0] eq 'remove' && !$error)
  { $url = '.admin-general'.$lang; 
    remove();
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return (SPINE::Base::Content::default(), $SPINE::Transparent::Constant::NOT_FOUND); }

  my $style = shift @{$style_dbi->get({name=>$content->style, count=>1})};
  if (!ref $style)
  { $content = shift @{$content_dbi->get({name=>".404", count=>1})} || SPINE::Base::Content::default(); 
    my $body = $content->body;
    $body =~ s/\$page/$url/g;
    my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/;
    $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
    $body =~ s/\$serversig/$serversig/g;
    $content->body($body);
  }
  my $body = $content->body if ref $content;

  #This part is tricky. This part will merge permissions (r-- in group A and -wx in group B = rwx)
  if ( ($params[0] eq 'edit' || $params[0] eq 'save' || $params[0] eq 'new') && !$error)
  { my $edit_content = shift @{$content_dbi->get({name=>$page}, count=>1)};
    my @li = @{$style_dbi->get()};
    my @list = ();
    for my $c (@li)
    { my $readgperms = $c->permissions & READGPERMISSIONS;
      $readgperms =~ s/0//g;
      my $readwperms = $c->permissions & READWPERMISSIONS;
      $readwperms =~ s/0//g;
      my @groups = grep { $_ eq $c->usergroup } @usergroups;
      if ( ($user eq 'admin' || #User is admin
            $c->owner eq $user || #User is owner of content
            $readwperms) || #Style is world readable
            (@groups && $readgperms) #Style is group readable and user is part of group
         )
       { push(@list,$c->name); next; }
    }  

    my $stylelist = undef;
    my $macrolist = undef;
    my $icomment = undef;
    my $cbody = undef;    

    for(@list) { my $sel = $edit_content->style eq $_ ? ' selected' : ''; $stylelist .= qq(<option value="$_"$sel>$_\n); }
    my @macros = @{$macro_dbi->getlist()};
    for(@macros) { my $sel = $edit_content->macros eq $_ ? ' selected' : ''; $macrolist .= qq(<option value="$_"$sel>$_\n); }
    $cbody = $edit_content->body if ref $edit_content;
    $icomment = $edit_content->icomment if ref $edit_content;
    my @selected = ('',' checked');
    if ($edit_content->breaks) { @selected = reverse @selected; }
    my $breaks = qq(<input type="checkbox" value="1"$selected[0] name="breaks">);
    @selected = ('',' checked');
    if ($edit_content->logging) { @selected = reverse @selected; }
    my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
    my $group = undef;
    for(@groups) { my $sel = $edit_content->usergroup eq $_ ? ' selected' : ''; next if !$_; $group .= qq(<option$sel>$_); }
    my @perms = $edit_content->permissions =~ /^(\d)(\d)(\d)(\d)/;
    my @checked = (""," checked");
    my $logging = qq(<input type="checkbox" value="1"$selected[0] name="logging">);
    my $gpermissions = qq(Read: <input type="checkbox" name="groupr" value="1"$checked[$perms[0]]>);
    $gpermissions .= qq(Write: <input type="checkbox" name="groupw" value="1"$checked[$perms[1]]>);
    my $wpermissions = qq(Read: <input type="checkbox" name="worldr" value="1"$checked[$perms[2]]>);
    $wpermissions .= qq(Write: <input type="checkbox" name="worldw" value="1"$checked[$perms[3]]>);
    $cbody =~ s/\&/\&amp\;/g; 
    $cbody =~ s/\</\&lt\;/g;
    $cbody =~ s/\>/\&gt\;/g;
    $body =~ s/\$title/$edit_content->title/ge if ref $edit_content;
    $body =~ s/\$filename/$edit_content->name/ge if ref $edit_content;
    $body =~ s/\$owner/$edit_content->owner/ge if ref $edit_content;
    $body =~ s/\$type/$edit_content->type/ge if ref $edit_content;
    $body =~ s/\$stylelist/$stylelist/g;
    $body =~ s/\$breaks/$breaks/g;
    $body =~ s/\$logging/$logging/g;
    $body =~ s/\$macrolist/$macrolist/g;
    $body =~ s/\$group/$group/g;
    $body =~ s/\$keywords/$edit_content->keywords/ge if ref $edit_content;
    $body =~ s/\$lastmod/$edit_content->modified/ge if ref $edit_content;
    $body =~ s/\$size/length($cbody)/ge;
    $body =~ s/\$icomment/$icomment/g;
    $body =~ s/\$gpermissions/$gpermissions/g;
    $body =~ s/\$wpermissions/$wpermissions/g;
    $body =~ s/\$error/$ierror/g; 
    $body =~ s/\$body/$cbody/g;
  } 

  if ( ( (!$params[0] || $params[0] eq 'copy' || $params[0] eq 'remove') && $params[0] ne 'edit' ) || $error )
  { my @li = @{$content_dbi->get()}; 
    my $list = undef;
    my $c = undef;
    my @list = ();

    #Only show hidden files in the listing if you are admin
    #Comment these 2 lines if you wish to include the dot-files in the listing..
    if ($user ne 'admin')
    { @li = grep { $_->name =~ /^[^\.]/ } @li; }
    
    for $c (@li)
    { my $readgperms = $c->permissions & READGPERMISSIONS;
      $readgperms =~ s/0//g;
      my $readwperms = $c->permissions & READWPERMISSIONS;
      $readwperms =~ s/0//g;
      my @groups = grep { $_ eq $c->usergroup } @usergroups;
      if ( ($user eq 'admin' || #User is admin
            $c->owner eq $user || #User is owner of content
            $readwperms) || #Content is world readable
            (@groups && $readgperms) #Content is group readable and user is part of group
         )
       { push(@list,$c->name); next; }
    }  
    for(@list) { $list .= qq(<option value="$_">$_\n); }
    $body =~ s/\$list/$list/g;
    $body =~ s/\$type/content/g;
    $body =~ s/\$label/content/g;
    $body =~ s/\$error/$error/g;        
  } 
  $content->body($body);
  return $content;
}

sub save
{ my $content = shift @{$content_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $content->owner eq $user || 
      $content->permissions =~ /^\d1/ || $content->permissions =~ /\d1$/)
  { $content->title($request->param('title')) if ref $content;
    $content->style($request->param('style')) if ref $content;
    $content->keywords($request->param('keywords')) if ref $content;
    $content->macros($request->param('macros')) if ref $content;
    my $logging = $request->param('logging') || 0 if ref $content;
    $content->logging($request->param($logging)) if ref $content;
    my $breaks = $request->param('breaks') || 0 if ref $content;
    $content->breaks($breaks) if ref $content;
    $content->type($request->param('type')) if ref $content;
    $content->body($request->param('body')) if ref $content;
    my $permissions = scalar $request->param('groupr') ? "1" : 0;
    $permissions .= scalar $request->param('groupw') ? "1" : 0;
    $permissions .= scalar $request->param('worldr') ? "1" : 0;
    $permissions .= scalar $request->param('worldw') ? "1" : 0;      
    $content->permissions($permissions) if ref $content;
    $content->usergroup($request->param('usergroup')) if ref $content;
    $content->icomment($request->param('icomment')) if ref $content;  
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $content->modified("$year-$mon-$day $hour:$min:$sec") if ref $content;
    $content_dbi->update($content);
  }
  else
  { $ierror = $valid_perms_string.$save_content_string; }
}

sub copy
{ my $content = shift @{$content_dbi->get({name=>$request->param('name')})};
  if ($user eq 'admin' || $content->owner eq $user || 
      $content->permissions =~ /^1/ || $content->permissions =~ /1\d$/)
  { $content->name($request->param('target'));
    $content->id(0);
    $content_dbi->add($content);
  }
}

sub remove 
#Document: You need both read and write permissions to delete a content
{ my $content = shift @{$content_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $content->owner eq $user || 
      $content->permissions =~ /^\11/ || $content->permissions =~ /11$/)  
  { $content_dbi->delete($content); }
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Content

=head1 DESCRIPTION

This is the Admin Content Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 APACHE CONFIG

How to set up Apache::SPINE::Index in your Apache config file...

  <IfModule mod_perl.c>
   PerlModule Apache::DBI
 
  <Location /hendrik>
    SetHandler perl-script
    PerlHandler Apache::SPINE::Index
    PerlSetVar dbd mysql
    #Declare the Database Driver here
    PerlSetVar dbname spine
    #Declare the database name here
    PerlSetVar dbuser user
    #Declare the database user here
    PerlSetVar dbpwd password
    #Declare the database password here
    PerlSetVar main index.html
    #Define the main content here
    PerlLogHandler Apache::SPINE::Log
   </Location>

  </IfModule>

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
