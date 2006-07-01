package SPINE::Handler::Admin::Navbar;

## This module is part of SPINE
## Copyright 2000-2006 Hendrik Van Belleghem
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

## $Author: beatnik $ - $Date: 2006/02/22 20:37:54 $ - $Revision: 1.40 $

use Data::Dumper;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Style;
use SPINE::DBI::Content;
use SPINE::DBI::Navbar;
use SPINE::DBI::Button;
use SPINE::DBI::Session;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Attribute;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

#Apache::Request Handler
#DB Handler

use vars qw($VERSION $content_dbi $style_dbi $user_dbi $usergroup_dbi $navbar_dbi $navbarbutton_dbi $adminaccess_dbi $attribute_dbi $session_dbi $request $user $adminaccess $error $ierror $readperms $writeperms $execperms %i18n %default);
use vars qw($valid_perms_string $enter_name_string $create_navbar_string $remove_navbar_string $edit_navbar_string $save_navbar_string $copy_navbar_string $navbar_exists_string $navbar_notexists_string $add_button_string $edit_button_string $delete_button_string);

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
  $navbar_dbi = SPINE::DBI::Navbar->new($dbh);
  $navbarbutton_dbi = SPINE::DBI::Button->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = %{$_} if $_;
    $default{$hash{'NAME'}} = $hash{'VALUE'};
  }

  my $lang = $default{'lang'} || "";
  $lang = ".$lang" if $lang;
  $lang = "" if $lang eq ".en";

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>$lang)};
  for(@i18n_hash)
  { my %hash = %{$_} if $_;
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $create_navbar_string = $i18n{'create_navbar'} || "Create a new navigation bar<br>";
  $remove_navbar_string = $i18n{'remove_navbar'} || "Remove a navigation bar<br>";
  $edit_navbar_string = $i18n{'edit_navbar'} || "Edit a navigation bar<br>";
  $save_navbar_string = $i18n{'save_navbar'} || "Save a navigation bar<br>";
  $copy_navbar_string = $i18n{'copy_navbar'} || "Copy a navigation bar<br>";
  $add_button_string = $i18n{'add_button'} || "Add a button to the navigation bar<br>";
  $edit_button_string = $i18n{'edit_button'} || "Edit a button in the navigation bar<br>";
  $delete_button_string = $i18n{'delete_button'} || "Delete a button from the navigation bar<br>";
  $navbar_exists_string = $i18n{'navbar_exists'} || "This navigation bar already exists!<br>";
  $navbar_notexists_string = $i18n{'navbar_not_exists'} || "This navigation bar does not exist!<br>";
  
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'navbar'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;

  shift @params;
  if (!$params[0] || !$page || $page eq $enter_name_string)
  { $url = '.admin-general'; @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_navbar_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'addbutton' && !$writeperms)
  { $error = $valid_perms_string.$add_button_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'editbutton' && !$writeperms)
  { $error = $valid_perms_string.$edit_button_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_navbar_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_navbar_string; 
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_navbar_string; 
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = $valid_perms_string.$copy_navbar_string; 
    $url = '.admin-general'; 
  }

  my $edit_navbar = shift @{$navbar_dbi->get({name=>$page}, count=>1)};
  if ($edit_navbar && $params[0] eq 'new' && !$error)
  { $error = $navbar_exists_string; 
    $url = '.admin-general'; 
  }

  if (!$edit_navbar && ($params[0] eq 'edit' || $params[0] eq 'copy' || $params[0] eq 'remove')&& !$error)
  { $error = $navbar_notexists_string;
    $url = '.admin-general'; 
  }
 
  if ($params[0] eq 'new' && !$error)
  { my $n = SPINE::Base::Navbar->default(); 
    $n->name($page); $n->owner($user);
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $n->modified("$year-$mon-$day $hour:$min:$sec") if ref $n;
    $navbar_dbi->add($n);
    $url = '.admin-navbar'; 
  }

  if ($params[0] eq 'edit' && !$error)
  { $url = '.admin-navbar'; }

  if ($params[0] eq 'editbutton' && !$error)
  { $url = '.admin-navbar'; 
    # This part catches the image as button bug in IE.
    my $save = $request->param('save.x') ? "save" : "";
    my $delete = $request->param('delete.x') ? "delete" : "";    
    my $moveup = $request->param('moveup.x') ? "moveup" : "";
    my $movedown = $request->param('movedown.x') ? "movedown" : "";
    my $action = $save || $delete || $moveup || $movedown; 
    savebutton() if $action eq "save";
    deletebutton() if $action eq "delete";
    moveup() if $action eq "moveup";
    movedown() if $action eq "movedown";          
  }

  if ($params[0] eq 'addbutton' && !$error)
  { my $edit_navbar = shift @{$navbar_dbi->get({name=>$page, count=>1})};
    my $n = SPINE::Base::Button->default(); 
    $url = '.admin-navbar'; 
    $n->navbar($request->param("id"));
    $n->link($request->param("link"));
    $n->image($request->param("image"));
    $n->label($request->param("label"));
    $n->position($request->param("position"));
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $edit_navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $edit_navbar;
    $navbarbutton_dbi->add($n);
    $navbar_dbi->update($edit_navbar);
  }
  
  if ($params[0] eq 'save' && !$error)
  { $url = '.admin-navbar'; 
    save();
  }

  if ($params[0] eq 'copy' && !$error)
  { $url = '.admin-general'; 
    copy();
  }

  if ($params[0] eq 'remove' && !$error)
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
    $body =~ s/\$page/$url/g;
    my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/;
    $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
    $body =~ s/\$serversig/$serversig/g;
    $content->body($body);
  }
  my $body = $content->body if ref $content;

  if ( ($params[0] eq 'edit' || $params[0] eq 'save' || $params[0] eq 'new' || $params[0] eq 'editbutton' || $params[0] eq 'addbutton') && !$error)
  { my $edit_navbar = shift @{$navbar_dbi->get({name=>$page, count=>1})};
    my @buttons = @{$navbarbutton_dbi->get({navbar=>$edit_navbar->id})};
    my $lastbutton = pop(@buttons);
    my $lastposition = 0;
    my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
    my $group = undef;
    for(@groups) 
    { my $sel = $edit_navbar->usergroup eq $_ ? ' selected' : ''; 
      next if !$_; $group .= qq(<option$sel>$_); 
    }
    my @perms = $edit_navbar->permissions =~ /^(\d)(\d)(\d)(\d)/;
    my @checked = (""," checked");
    my $gpermissions = qq(Read: <input type="checkbox" name="groupr" value="1"$checked[$perms[0]]>);
    $gpermissions .= qq(Write: <input type="checkbox" name="groupw" value="1"$checked[$perms[1]]>);
    my $wpermissions = qq(Read: <input type="checkbox" name="worldr" value="1"$checked[$perms[2]]>);
    $wpermissions .= qq(Write: <input type="checkbox" name="worldw" value="1"$checked[$perms[3]]>);
    $lastposition = $lastbutton->position if $lastbutton;
    $lastposition++;
    push(@buttons,$lastbutton)  if $lastbutton;
    $body =~ s/\$filename/$edit_navbar->name/ge if ref $edit_navbar;
    $body =~ s/\$navbar/$edit_navbar->id/ge if ref $edit_navbar;
    $body =~ s/\$owner/$edit_navbar->owner/ge if ref $edit_navbar;
    $body =~ s/\$usergroup/$group/ge if ref $edit_navbar;
    $body =~ s/\$wpermissions/$wpermissions/ge if ref $edit_navbar;
    $body =~ s/\$gpermissions/$gpermissions/ge if ref $edit_navbar;
    $body =~ s/\$modified/$edit_navbar->modified/ge if ref $edit_navbar;

    my $alignlist = undef;
    for(qw(none left center right)) 
    { my $sel = $edit_navbar->alignment eq $_ ? ' selected' : ''; 
      $alignlist .= qq(<option value="$_"$sel>$_\n); 
    }

    my $poslist = undef;
    for(qw(vertical horizontal)) 
    { my $sel = $edit_navbar->positioning eq $_ ? ' selected' : ''; 
      $poslist .= qq(<option value="$_"$sel>$_\n); 
    }

    my $stylelist = undef;
    for(qw(normal bold italic bold-italic)) 
    { my $sel = $edit_navbar->style eq $_ ? ' selected' : ''; 
      $stylelist .= qq(<option value="$_"$sel>$_\n); 
    }

    my $separator = $edit_navbar->sep if ref $edit_navbar;
    $separator =~ s/</&lt;/g;
    $separator =~ s/>/&gt;/g;
    $separator =~ s/\"/&quot;/g;

    $body =~ s/\$positioning/$poslist/g if ref $edit_navbar;
    $body =~ s/\$alignment/$alignlist/g if ref $edit_navbar;
    $body =~ s/\$font/$edit_navbar->font/ge if ref $edit_navbar;
    $body =~ s/\$color/$edit_navbar->color/ge if ref $edit_navbar;
    $body =~ s/\$size/$edit_navbar->size/ge if ref $edit_navbar;
    $body =~ s/\$style/$stylelist/g if ref $edit_navbar;
    $body =~ s/\$separator/$separator/g;
    $body =~ s/\$position/$lastposition/g;
    $body =~ s/\$error/$ierror/g;
    my $buttons = "";
    my $button_content = shift @{$content_dbi->get({name=>".admin-navbar-button", count=>1})};
    if (!ref $button_content)
    { $button_content = shift @{$content_dbi->get({name=>".404", count=>1})} || SPINE::Base::Content::default(); 
      my $body = $button_content->body;
      $body =~ s/\$page/.admin-navbar-button/g;
      my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/;
      $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
      $body =~ s/\$serversig/$serversig/g;
      $button_content->body($body);
    }    
    for(@buttons)
    { my $bodybutton = $button_content->body;
      $bodybutton =~ s/\$buttonid/$_->id/ge if ref $_;
      $bodybutton =~ s/\$id/$_->navbar/ge if ref $_;
      $bodybutton =~ s/\$name/$edit_navbar->name/ge if ref $_;
      $bodybutton =~ s/\$position/$_->position/ge if ref $_;
      $bodybutton =~ s/\$border/$_->border/ge if ref $_;
      $bodybutton =~ s/\$link/$_->link/ge if ref $_;      
      $bodybutton =~ s/\$image/$_->image/ge if ref $_;      
      $bodybutton =~ s/\$label/$_->label/ge if ref $_;      
      $bodybutton =~ s/\$target/$_->target/ge if ref $_;      
      $bodybutton =~ s/\$width/$_->width/ge if ref $_;      
      $bodybutton =~ s/\$height/$_->height/ge if ref $_;      
      $bodybutton =~ s/\$font/$_->font/ge if ref $_;      
      $bodybutton =~ s/\$color/$_->color/ge if ref $_;      
      $bodybutton =~ s/\$size/$_->size/ge if ref $_;      
      $bodybutton =~ s/\$style/$_->style/ge if ref $_;      
      $bodybutton =~ s/\$class/$_->class/ge if ref $_;                                                            
      $buttons .= $bodybutton;
    }
    $body =~ s/\$buttonlist/$buttons/g;  
  } 

  if ( ((!$params[0] || $params[0] eq 'copy' || $params[0] eq 'remove') && $params[0] ne 'edit' ) || $error)
  { my @li = @{$navbar_dbi->get()};
    my $list = undef;
    my $c = undef;
    my @list = ();
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
    @list = sort { $a cmp $b } @list;
    for(@list) { $list .= qq(<option value="$_">$_\n); }
    $body =~ s/\$list/$list/g;
    $body =~ s/\$type/navbar/g;
    $body =~ s/\$label/navigation bar/g;
  } 
  $body =~ s/\$error/$error/g;
  $content->body($body);
  return $content;
}

sub save
{ #Add other fields here!!
  my $navbar = shift @{$navbar_dbi->get({name=>scalar($request->param('name')), count=>1})};
  if ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^\d1/ || $navbar->permissions =~ /\d1$/)
  { my $permissions = scalar $request->param('groupr') ? "1" : 0;
    $permissions .= scalar $request->param('groupw') ? "1" : 0;
    $permissions .= scalar $request->param('worldr') ? "1" : 0;
    $permissions .= scalar $request->param('worldw') ? "1" : 0;      
    $navbar->permissions($permissions) if ref $navbar;
    $navbar->style($request->param('style')) if ref $navbar;
    $navbar->color($request->param('color')) if ref $navbar;
    $navbar->font($request->param('font')) if ref $navbar;
    $navbar->size($request->param('size')) if ref $navbar;    
    $navbar->alignment($request->param('alignment')) if ref $navbar;    
    $navbar->positioning($request->param('positioning')) if ref $navbar;        
    $navbar->sep($request->param('separator')) if ref $navbar;        
    $navbar->owner($request->param('owner')) if ref $navbar;        
    $navbar->usergroup($request->param('usergroup')) if ref $navbar;            
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $navbar;
    $navbar_dbi->update($navbar);
  }
}

sub savebutton
{ my $button = shift @{$navbarbutton_dbi->get({navbar=>$request->param('navbar'), position=>$request->param('position'), count=>1})};
  my $navbar = shift @{$navbar_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^\d1/ || $navbar->permissions =~ /\d1$/)
  { my $label = $request->param('label') || $request->param('link');
    $button->link($request->param('link')) if ref $button;
    $button->image($request->param('image')) if ref $button;
    $button->label($label) if ref $button;
    $button->position($request->param('position')) if ref $button;    
    $button->target($request->param('target')) if ref $button;    
    $button->border($request->param('border')) if ref $button;    
    $button->width($request->param('width')) if ref $button;    
    $button->height($request->param('height')) if ref $button;        
    $button->style($request->param('style')) if ref $button;
    $button->color($request->param('color')) if ref $button;
    $button->font($request->param('font')) if ref $button;
    $button->size($request->param('size')) if ref $button;    
    $button->class($request->param('class')) if ref $button;    
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $navbar;
    $navbar_dbi->update($navbar);
    $navbarbutton_dbi->update($button);
  } else 
  { $ierror = $valid_perms_string.$save_navbar_string; }
}

sub moveup
{ my $button = shift @{$navbarbutton_dbi->get({navbar=>$request->param('navbar'), position=>$request->param('position'), count=>1})};
  my $navbar = shift @{$navbar_dbi->get({name=>$request->param('name'), count=>1})};
  if ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^\d1/ || $navbar->permissions =~ /\d1$/)
  { my $position = $request->param('position');
    $position--;
    my $otherbutton = shift @{$navbarbutton_dbi->get({navbar=>$request->param("navbar"),position=>$position, count=>1})};
    if (ref($otherbutton) eq "SPINE::Base::Button")
    { my $otherposition = $otherbutton->position if $otherbutton;
      $otherposition++;
      $otherbutton->position($otherposition);
      $navbarbutton_dbi->update($otherbutton);    
      $button->position($position) if ref $button;    
      my ($sec,$min,$hour,$day,$mon,$year) = localtime;
      $mon++; $year += 1900;
      $navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $navbar;
      $navbar_dbi->update($navbar);
      $navbarbutton_dbi->update($button);
    }
  }
}

sub movedown
{ my $button = shift @{$navbarbutton_dbi->get({navbar=>$request->param('navbar'), position=>$request->param('position'), count=>1})};
  my $navbar = shift @{$navbar_dbi->get({name=>$request->param('name'),count=>1 })};
  if ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^\d1/ || $navbar->permissions =~ /\d1$/)
  { my $position = $request->param('position');
    $position++;
    my $otherbutton = shift @{$navbarbutton_dbi->get({navbar=>$request->param("navbar"),position=>$position, count=>1})};
    if (ref($otherbutton) eq "SPINE::Base::Button")
    { my $otherposition = $otherbutton->position;
      $otherposition--;
      $otherbutton->position($otherposition);
      $navbarbutton_dbi->update($otherbutton);    
      $button->position($position) if ref $button;    
      my ($sec,$min,$hour,$day,$mon,$year) = localtime;
      $mon++; $year += 1900;
      $navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $navbar;
      $navbar_dbi->update($navbar);
      $navbarbutton_dbi->update($button);
    }
  }
}

sub deletebutton
{ my $button = shift @{$navbarbutton_dbi->get({navbar=>$request->param('navbar'), position=>$request->param('position'), count=>1})};
  my $navbar = shift @{$navbar_dbi->get({name=>$request->param('name'), count=>1 })};
  if ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^\d1/ || $navbar->permissions =~ /\d1$/)
  { $navbarbutton_dbi->delete($button);
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $navbar;
    $navbar_dbi->update($navbar);
    # Note to myself: The part below is needed because deleting a button causes a gap. Up and Down use ++ and -- above so button position need to be sequential
    my @sortbuttons = @{$navbarbutton_dbi->get({navbar=>$request->param('navbar'),sort=>"position"})};
    my $i = 1;
    for $button (@sortbuttons)
    { if (ref($button))
      { $button->position($i);
        $navbarbutton_dbi->update($button); 
        $i++;
      }
    }
  }
}

sub copy
{ my $navbar = shift @{$navbar_dbi->get({name=>$request->param('name') , count=>1})};
  if ($navbar && ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^1/ || $navbar->permissions =~ /1\d$/))
  { $navbar->name($request->param('target'));
    my @buttons = @{$navbarbutton_dbi->get({navbar=>$navbar->id})};
    $navbar->id(0);
    $navbar_dbi->add($navbar);
    my $copied_navbar = shift @{$navbar_dbi->get({name=>$request->param('target'), count=>1})};
    my $new_id = $copied_navbar->id;
    for my $button(@buttons)
    { $button->navbar($new_id);
      $navbarbutton_dbi->add($button); 
    }
  }
}

sub remove #Document: You need both read and write permissions to delete a navbar
{ my $navbar = shift @{$navbar_dbi->get({name=>$request->param('name') , count=>1})};
  if ($user eq 'admin' || $navbar->owner eq $user || 
      $navbar->permissions =~ /^\11/ || $navbar->permissions =~ /11$/)  
  { my @buttons = @{$navbarbutton_dbi->get({navbar=>$navbar->id})};
    for(@buttons)
    { $navbarbutton_dbi->delete($_); }
    $navbar_dbi->delete($navbar); 
  }
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Navbar

=head1 DESCRIPTION

This is the Admin Navbar Handler for SPINE.

This module manages the Administration side of the Navigation Bar feature. 

=head1 TODO

Document how permissions work in the Navigation Admin Handler.

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
