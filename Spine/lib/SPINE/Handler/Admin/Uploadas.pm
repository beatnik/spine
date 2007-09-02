package SPINE::Handler::Admin::Uploadas;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.45 $

use strict;

use vars qw($VERSION $content_dbi $style_dbi $user_dbi $usergroup_dbi $macro_dbi $adminaccess_dbi $session_dbi $attribute_dbi $request $user $adminaccess $error $ierror $readperms $writeperms $execperms %i18n %default);
use vars qw($valid_perms_string $enter_name_string $new_upload_string $new_folder_string $copy_file_string $rename_file_string $read_folder_string $mkdir_failed_string $copy_failed_string $remove_failed_string $rename_failed_string $readdir_failed_string $docroot_permissions_string $upload_failed_string $upload_unknown_string $file_exists_string $file_notexists_string $folder_exists_string $folder_notexists_string );

use SPINE::Constant;
use SPINE::Base::Content;
use SPINE::Base::Style;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::DBI::Style;
use SPINE::DBI::Attribute;
use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;

use SPINE::Transparent::Constant;

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $filename = $request->param("filename"); # Name of the selected radiobutton
  my $action = $request->param("action"); # The file operation, eg copy, delete, etc
  SPINE::Transparent::Constant->new($request);
  my %cookies = $request->cookies;
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  $content_dbi = SPINE::DBI::Content->new($dbh);  
  $style_dbi = SPINE::DBI::Style->new($dbh);  

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $user = "admin";
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
    %hash = %{$_} if $_;
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }

   $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $enter_name_string = $i18n{'enter_name'} || "Enter name";
  $new_upload_string = $i18n{'new_upload'} || "Upload a file";
  $read_folder_string = $i18n{'read_folder'} || "Read folder contents";
  $mkdir_failed_string = $i18n{'mkdir_failed'} || "Unable to create folder.";
  $copy_failed_string = $i18n{'copy_failed'} || "Unable to copy file.";
  $remove_failed_string = $i18n{'remove_failed'} || "Unable to remove file.";
  $rename_failed_string = $i18n{'rename_failed'} || "Unable to rename file.";
  $readdir_failed_string = $i18n{'readdir_failed'} || "Unable to read folder.";
  $docroot_permissions_string = $i18n{'docroot_permissions'} || "Does the document root directory have correct permissions?";
  $upload_failed_string = $i18n{'upload_failed'} || "File could not be uploaded. If this problem persists, submit a bug report.";
  $upload_unknown_string = $i18n{'upload_unknown'} || "Error creating file:";
  $file_exists_string = $i18n{'file_exists'} || "This file already exists!";
  $file_notexists_string = $i18n{'file_not_exists'} || "This file does not exists!";

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  my $adminaccess;
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'fileman'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  my $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  my $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  my $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;

  $filename =~ s/[;\`'!\?\@\|\"\*~<>\^\(\)\[\]\{\}\$\n\f\a\r\0\t\s]+//gmx; 
  $error = "";
  
  if ($filename =~ /^.*[\/\\](.*)$/mx)
  { $filename = $1 if $1; }

  my @params = $request->param;
  my @checkboxes = grep { /^check\d*$/mx } sort { $a <=> $b } @params;

  if ($action eq "uploadcontent" && $filename && $request->method() eq "POST")
  { my $upload = $request->upload("filename");
    set_$error("File could not be uploaded. If this problem persists, submit a bug report.") if !$upload;
    my $fh = $upload->fh;
    if ($fh)
    { my $uploaded_content = SPINE::Base::Content::default;
      my $data = undef;
      { local $/; $data .= <$fh>; }
      $uploaded_content->body($data);
      $uploaded_content->name($filename);
      $content_dbi->add($uploaded_content);
    } else
    { set_error("File could not be uploaded. If this problem persists, submit a bug report."); }
  }
  if ($action eq "uploadstyle" && $filename && $request->method() eq "POST")
  { my $upload = $request->upload("filename");
    set_$error("File could not be uploaded. If this problem persists, submit a bug report.") if !$upload;
    my $fh = $upload->fh;
    if ($fh)
    { my $uploaded_style = SPINE::Base::Style::default;
      my $data = undef;
      { local $/; $data .= <$fh>; }
      $uploaded_style->body($data);
      $uploaded_style->name($filename);
      $style_dbi->add($uploaded_style);
    } else
    { set_error("File could not be uploaded. If this problem persists, submit a bug report."); }
  }

  my $list = "";  
  
  if (!$readperms)  
  { set_error("You do not have valid permissions for this operation : Read Folder Contents"); $list = $error; } 
  if ($error) { $error = qq(<p class="error">$error</p>); } 
  $list = <<"EOF";
  $error<font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <b>Upload as content</b></font><form name="uploadform" method="post" action="<?SPINE_Location?>admin/uploadas" enctype="multipart/form-data">&nbsp;&nbsp;Upload as content : <input type="hidden" name="action" value="uploadcontent"><input type="file" name="filename">&nbsp;<input type="submit" class="button" value="Upload"></form><hr width="95%"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"> <b>Upload as style</b></font><form name="uploadform" method="post" action="<?SPINE_Location?>admin/uploadas" enctype="multipart/form-data">&nbsp;&nbsp;Upload as content : <input type="hidden" name="action" value="uploadstyle"><input type="file" name="filename">&nbsp;<input type="submit" class="button" value="Upload"></form>
EOF
  my $content = SPINE::Base::Content->new({style=>".admin",body=>$list, title=>"File Manager"});
  return $content;
}

sub set_error { $error = shift @_; return; }

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::File

=head1 DESCRIPTION

This is the Admin Filemanager Handler for SPINE.

=head1 CONFIGURATION

=item CHROOT

Define the chroot'ed environment. By default this is the Document Root. All actions in the File Manager are done with the chroot directory as root.
This means that if you create a 'Pictures' directory in the File Manager root, you create a 'Pictures' subdirectory in the directory specified as chroot directory.
Set this directory as restrictive as possible.

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
    #Define the chroot path - All File Manager operations are performed below this directory.
    PerlSetVar chroot /home/www/html
   </Location>

  </IfModule>

=head1 VERSION

This is spine 1.3 beta.

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
