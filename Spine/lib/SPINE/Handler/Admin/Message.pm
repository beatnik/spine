package SPINE::Handler::Admin::Message;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.52 $

use SPINE::DBI::Content;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Session;
use SPINE::DBI::Message;
use SPINE::DBI::Messagegroup;
use SPINE::DBI::Attribute;
use SPINE::DBI::Adminaccess;
use SPINE::Constant;

use strict;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $message_dbi $request $messagegroup_dbi $user_dbi $usergroup_dbi $session_dbi $adminaccess_dbi $user $adminaccess $error $readperms $writeperms $execperms %i18n %default $attribute_dbi);
use vars qw($valid_perms_string $enter_name_string $create_message_string $create_messagegroup_string $remove_message_string $remove_messagegroup_string $edit_message_string $save_message_string $copy_messagegroup_string $save_messagegroup_string $messagegroup_exists_string $messagegroup_notexists_string $ierror);

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
  %default = ();
  %i18n = ();

  my $page = $request->param('name');
  $error = '';
  $ierror = '';

  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//;
  my $new_id = undef;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $message_dbi = SPINE::DBI::Message->new($dbh);
  $messagegroup_dbi = SPINE::DBI::Messagegroup->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

  $url = '.admin-general'; 

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
  $create_message_string = $i18n{'create_message'} || "Create a new message<br>";
  $remove_message_string = $i18n{'remove_message'} || "Remove a message<br>";
  $remove_messagegroup_string = $i18n{'remove_messagegroup'} || "Remove a messagegroup<br>";
  $edit_message_string = $i18n{'edit_message'} || "Edit a message<br>";
  $save_message_string = $i18n{'save_message'} || "Save a message<br>";
  $save_messagegroup_string = $i18n{'save_messagegroup'} || "Save a messagegroup<br>";
  $copy_messagegroup_string = $i18n{'copy_messagegroup'} || "Copy a messagegroup<br>";
  $messagegroup_exists_string = $i18n{'messagegroup_exists'} || "This messagegroup already exists!<br>";
  $messagegroup_notexists_string = $i18n{'messagegroup_not_exists'} || "This messagegroup does not exist!<br>";

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user, count=>1}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'message'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }
  
  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;

  shift @params;
  if (!$params[0] || (!$page && $params[0] ne "create") || $page eq $enter_name_string)
  { @params = (); }

  if ($params[0] eq 'new' && !$execperms)
  { $error = $valid_perms_string.$create_messagegroup_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'create' && !$execperms)
  { $error = $valid_perms_string.$create_message_string;
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_message_string; # or should this be $remove_messagegroup_string???
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'edit' && !$readperms)
  { $error = $valid_perms_string.$edit_message_string; # or should this be $remove_messagegroup_string???
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'save' && !$writeperms)
  { $error = $valid_perms_string.$save_message_string; # or should this be $save_messagegroup_string???
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'savegroup' && !$writeperms)
  { $error = $valid_perms_string.$save_messagegroup_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'copy' && ( !$writeperms || !$readperms || !$execperms ) )
  { $error = $valid_perms_string.$copy_messagegroup_string;
    $url = '.admin-general'; 
  }

  if ($params[0] eq 'new' && !$error)
  { $messagegroup_dbi->add(SPINE::Base::Messagegroup->new({id=>0,name=>scalar($request->param("name")), content=>'.message', owner=>$user, usergroup=>"admin", permissions=>'111111'}));
    $url = '.admin-message'; 
  }

  my $edit_messagegroup = shift @{$messagegroup_dbi->get({name=>$request->param('name')}, count=>1)};
  if ($edit_messagegroup && $params[0] eq 'create' && !$error)
  { $error = $messagegroup_exists_string;
    $url = '.admin-general'; 
  }
  
  if ($params[0] eq 'create' && !$error)
  { my ($sec,$min,$hour,$day,$mon,$year) = localtime(time);
    $mon++; $year += 1900;
    my $mdate = "$year-$mon-$day $hour:$min:$sec";
    $new_id = $message_dbi->add(SPINE::Base::Message->new({mdate=>$mdate, mgroup=>scalar($request->param('mgroup')), owner=>scalar($request->param('owner')), subject=>scalar($request->param('subject')), parent=>scalar($request->param('parent')) }));
    $url = '.admin-message'; 
  }

  if ($params[0] eq 'edit' && !$error)
  { $url = '.admin-message'; }

  if ($params[0] eq 'save' && !$error)
  { $url = '.admin-message'; 
    my $save = $request->param('save.x') ? "save" : "";
    my $delete = $request->param('delete.x') ? "delete" : "";    
    my $action = $save || $delete; 
    save() if $action eq "save";
    remove() if $action eq "delete";
  }

  if ($params[0] eq 'savegroup' && !$error)
  { $url = '.admin-message'; 
    savemessagegroup();
  }

  if ($params[0] eq 'copy' && !$error)
  { copy(); }

  if ($params[0] eq 'remove' && !$error)
  { remove();  }

  if ($params[0] eq 'remove' && $request->param("id"))
  { $url = '.admin-message';  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }
  my $body = $content->body if ref $content;

  if (!$error && ($params[0] eq 'edit' || $params[0] eq 'new' || $params[0] eq 'savegroup' || $params[0] eq 'save' || $params[0] eq 'create' || ($params[0] eq 'remove' &&  $request->param('id') ) ) )
  { my $message = undef;
    my $data;
    my $group = $request->param('name') || $request->param('mgroup');
    my $parent = $request->param('parent') || 0;
    my $id = $request->param('id') || $new_id;
    my @messages = @{ $message_dbi->get({mgroup=>$group,parent=>$parent}) } ; 
    my $messagegroup = shift @{ $messagegroup_dbi->get({name=>$group, count=>1}) } ;
    my $readgperms = $messagegroup->permissions & READGPERMISSIONS;
    my @list = ();
    $readgperms =~ s/0//g;
    my $readwperms = $messagegroup->permissions & READWPERMISSIONS;
    $readwperms =~ s/0//g;
    my @groups = grep { $_ eq $messagegroup->usergroup } @usergroups;
    $id ||= 0;

    #This part is tricky. This part will merge permissions (r-- in group A and -wx in group B = rwx)
    my @li = @{$content_dbi->get()};
    my @clist = ();
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
       { push(@clist,$c->name); next; }
    }  

    my $contentlist = "";
    my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
    my $group = undef;
    for(@groups) { my $sel = $messagegroup->usergroup eq $_ ? ' selected' : ''; next if !$_; $group .= qq(<option$sel>$_); }
    my @perms = $messagegroup->permissions =~ /^(\d)(\d)(\d)(\d)/;
    my @checked = (""," checked");
    my $gpermissions = qq(Read: <input type="checkbox" name="groupr" value="1"$checked[$perms[0]]>);
    $gpermissions .= qq(Write: <input type="checkbox" name="groupw" value="1"$checked[$perms[1]]>);
    my $wpermissions = qq(Read: <input type="checkbox" name="worldr" value="1"$checked[$perms[2]]>);
    $wpermissions .= qq(Write: <input type="checkbox" name="worldw" value="1"$checked[$perms[3]]>);    
    my @groups = @{$usergroup_dbi->getlist(field=>'usergroup')};
    my $group = undef;
    for(@groups) 
    { my $sel = $messagegroup->usergroup eq $_ ? ' selected' : ''; 
      next if !$_; $group .= qq(<option$sel>$_); 
    }
    for(@clist) { my $sel = $messagegroup->content eq $_ ? ' selected' : ''; $contentlist .= qq(<option value="$_"$sel>$_\n); }
    $contentlist = qq(<select name="content">$contentlist</select>);
    $data .= qq(<tr bgcolor="#ffffff">\n<form method="post" action="<?SPINE_Location?>admin/message/create/">\n<input type="hidden" name="mgroup" value=").$messagegroup->name.qq(">\n<input type="hidden" name="parent" value="$parent">);
    $data .= qq(<td>\n<input type="text" name="subject" class="input" value="Subject" size="25">\n</td>\n<td>\n<input type="text" name="owner" value="Owner" class="input" size="25">\n</td><td>&nbsp;</td>\n);
    $data .= qq(<td width="5">\n<input type="image" name="save" src="/images/save.png" title="Create Message">\n</td>\n</form>\n<td>&nbsp;</td>\n</tr>\n\n);

    if ( ($user eq 'admin' || #User is admin
        $messagegroup->owner eq $user || #User is owner of content
        $readwperms) || #Style is world readable
        (@groups && $readgperms) #Style is group readable and user is part of group
     )
    { @list = @messages; }
    for(@list)
    { my %hash = $_->tohash; 
      my @replies = @{ $message_dbi->get({mgroup=>$hash{mgroup},parent=>$hash{id}}) } ; 
      my $count = @replies;
      $count ||= 0;
      $data .= qq(<form action="<?SPINE_Location?>admin/message/save/" method="post"><tr bgcolor="#ffffff">\<td><input type="text" name="subject" class="input" size="25" value="$hash{subject}"></td>\n<td><input type="text" name="owner" class="input" size="25" value="$hash{owner}"></td>\n);
      $data .= qq(<td>$hash{mdate}</td>\n\n<input type="hidden" name="id" value="$hash{id}">\n<input type="hidden" name="name" value="$hash{mgroup}">);
      $data .= qq(<input type="hidden" name="parent" value="$hash{parent}">\n<td width="5">\n);
      $data .= qq(<input type="image" name="save" src="/images/save.png" title="Save Message">\n</td>);
      $data .= qq(<td width="50"><input type="image" name="delete" src="/images/delete.png" title="Delete Message">\n<img src="/images/preferences.png" onclick="o=document.getElementById('messagerow$hash{id}'); if(o.style.display=='inline'){o.style.display='none';}else{o.style.display='inline';}"></td>\n</tr>\n\n); 
      my $parentbit = "";
      my $parentmessage = shift @{ $message_dbi->get({mgroup=>$hash{mgroup},id=>$hash{parent}, count=>1}) } ;
      if ($parentmessage)
      { my %hash = $parentmessage->tohash; 
        $parentbit = qq(<br>Reply to message by <a href="<?SPINE_Location?>admin/message/edit/?name=$hash{mgroup}&id=$hash{id}">$hash{owner} : $hash{subject}</a>);
      }
      $data .= qq(<tr bgcolor="#ffffff">\n<td colspan="5"><table width="100%" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0" id="messagerow$hash{id}" style="display:none"><tr><td><textarea cols="80" rows="15" class="input" name="body">$hash{body}</textarea><br>Message Replies : <a href="<?SPINE_Location?>admin/message/edit/?name=$hash{mgroup}&parent=$hash{id}">$count</a>$parentbit</td></tr></table></td></tr></form>);
      
    }
   my $mgroup = $messagegroup->name;
   my $owner = $messagegroup->owner;
   $body =~ s/\$messagedata/$data/g;
   $body =~ s/\$messagegroup/$mgroup/g;
   $body =~ s/\$contentlist/$contentlist/g;   
   $body =~ s/\$gpermissions/$gpermissions/g;
   $body =~ s/\$wpermissions/$wpermissions/g;
   $body =~ s/\$owner/$owner/g;
   $body =~ s/\$group/$group/g;   
   $body
  } 

  if ($error || !$params[0] || $params[0] eq 'copy' || $params[0] eq 'remove') 
  { my @li = @{$messagegroup_dbi->get({})};
    my @list = ();
    for my $m (@li)
    { my $readgperms = $m->permissions & READGPERMISSIONS;
      $readgperms =~ s/0//g;
      my $readwperms = $m->permissions & READWPERMISSIONS;
      $readwperms =~ s/0//g;
      my @groups = grep { $_ eq $m->usergroup } @usergroups;
      if ( ($user eq 'admin' || #User is admin
            $m->owner eq $user || #User is owner of messagegroup
            $readwperms) || #messagegroup is world readable
            (@groups && $readgperms) #messagegroup is group readable and user is part of group
         )
       { push(@list,$m->name); next; }
    }  
    my $list = undef;
    @list = sort { $a cmp $b } @list;
    for(@list) { $list .= "<option value=\"$_\">$_\n"; }
    $body =~ s/\$list/$list/g;
    $body =~ s/\$type/message/g;
    $body =~ s/\$label/message group/g;
    $body =~ s/\$error/$error/g;        
  } 
  $content->body($body);
  return $content;
}

sub savemessagegroup
{ my $messagegroup = shift @{$messagegroup_dbi->get({name=>$request->param('name'), count=>1})};
  my $permissions = scalar $request->param('groupr') ? "1" : 0;
  $permissions .= scalar $request->param('groupw') ? "1" : 0;
  $permissions .= scalar $request->param('worldr') ? "1" : 0;
  $permissions .= scalar $request->param('worldw') ? "1" : 0;      
  $messagegroup->permissions($permissions) if ref $messagegroup;
  $messagegroup->content($request->param('content')) if ref $messagegroup;  
  $messagegroup->usergroup($request->param('usergroup')) if ref $messagegroup;
  $messagegroup_dbi->update($messagegroup);
}

sub save
{ my $message = shift @{$message_dbi->get({id=>scalar($request->param('id')), count=>1})};
  $message->subject($request->param('subject')) if ref $message;
  $message->owner($request->param('owner')) if ref $message;
  $message->body($request->param('body')) if ref $message;
  $message->mdate($request->param('mdate')) if ref $message;
  $message_dbi->update($message);
}

sub copy
{ my $messagegroup = shift @{$messagegroup_dbi->get({name=>$request->param('name'), count=>1})};
  $messagegroup->name($request->param('target'));
  $messagegroup_dbi->add($messagegroup);
  my @messages = @{ $message_dbi->get({mgroup=>$request->param('name')}) } ;
  for my $message (@messages)
  { $message->mgroup($request->param('target'));
    $message_dbi->add($message);
  }
}

sub remove
{ if ($request->param('name') && !$request->param('id') )
  { my $messagegroup = shift @{$messagegroup_dbi->get({name=>$request->param('name'), count=>1})};
    my @messages = @{ $message_dbi->get({mgroup=>$request->param('name')}) } ;
    for my $message (@messages)
    { $message_dbi->delete($message); }
    $messagegroup_dbi->delete($messagegroup);
  }
  if ($request->param('name') && $request->param('id') ) 
  { my $message = shift @{ $message_dbi->get({mgroup=>scalar $request->param('name'), id=>scalar $request->param('id') }) } ;
    $message_dbi->delete($message);
  }
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Message

=head1 DESCRIPTION

This is the Admin Message Handler for SPINE.

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
