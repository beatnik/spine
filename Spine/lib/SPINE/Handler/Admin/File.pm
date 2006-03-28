package SPINE::Handler::Admin::File;

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

use vars qw($VERSION $error);
use SPINE::Constant;
use SPINE::Base::Content;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use Apache::Constants qw(:common);
use File::Copy qw(copy);

use Apache::Cookie;

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $chroot = $request->dir_config("chroot") || $request->document_root;
  my $action = $request->param("action"); # The file operation, eg copy, delete, etc
  my $filename = $request->param("filename"); # Name of the selected radiobutton
  my $foldername = $request->param("foldername"); # Folder name used with create folder
  my $path = $request->param("path") || "/"; # Current virtual working directory (based on chroot)
  my $target = $request->param("target"); # used with copy as target filename
  my %cookies = Apache::Cookie->fetch;
  my $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);
  my $user_dbi = SPINE::DBI::User->new($dbh);
  my $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  
  $chroot =~ s/\/+$//;
  $chroot =~ s/^\/+//;
  $chroot = "/$chroot";

  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $user = "admin";
  $user = $session->username if $session;

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  my $adminaccess;
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'fileman'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  my $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//g;
  my $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//g;
  my $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//g;

  $path =~ s/\/+$//;
  $path =~ s/^\/+//;
  $path =~ s/[;\`'!\?\@\|\"\*~<>\^\(\)\[\]\{\}\$\n\f\a\r\0\t\s]+//g;   
  $path = "/$path" if $path;
  
  $target =~ s/\/+$//;
  $target =~ s/^\/+//;
  $target =~ s/[;\`'!\?\@\|\"\*~<>\^\(\)\[\]\{\}\$\n\f\a\r\0\t\s]+//g;

  $foldername =~ s/\/+$//;
  $foldername =~ s/^\/+//;
  $foldername =~ /^.*[\/\\](.*)$/;
  $foldername = $1 if $1;

  $foldername = "/$foldername" if $foldername;

  $filename =~ s/[;\`'!\?\@\|\"\*~<>\^\(\)\[\]\{\}\$\n\f\a\r\0\t\s]+//g; 
  $error = "";
  
  my @params = $request->param;
  my @checkboxes = grep { /^check\d*$/ } sort { $a <=> $b } @params;

  my $status = $request->parse;
  unless ($status == OK)
  { warn ($status, $request->notes('error-notes')); }

  if ($action eq "upload" && $filename && defined($path) && $writeperms)
  { my $upload = $request->upload("filename");
    set_$error("File could not be uploaded. If this problem persists, submit a bug report.") if !$upload;
    my $fh = $upload->fh;
    if ($fh)
    { if (-e "$chroot$path/$filename")
      { set_error("You're trying to upload a file that already exists!"); }
      else 
      { if (-W "$chroot$path/$filename")
        { set_error("You're trying to upload a file that already exists!"); }
        else
        { open(UPLOAD,">$chroot$path/$filename") || set_error("Error creating file: $!");
          binmode(UPLOAD);
          my $info = $upload->info;
          while(<$fh>) { print UPLOAD $_; }
          close(UPLOAD);
        }
      }   
    } else
    { set_error("File could not be uploaded. If this problem persists, submit a bug report."); }
  }
  
  if ($action eq "upload" && $filename && defined($path) && !$writeperms)
  { set_error("You do not have valid permissions for this operation : File Upload"); }
  
  if ($action eq "createfolder" && $foldername && $chroot.$path && $execperms)
  { if (-e "$chroot$path/$foldername" && -d "$chroot$path/$foldername") { set_error("You're trying to create a folder that already exists!"); }
    else { mkdir ("$chroot$path/$foldername") || set_error("Unable to create folder. Does the document root directory have correct permissions? ($!)"); }
  }
  
  if ($action eq "createfolder" && $foldername && $chroot.$path && !$execperms)
  { set_error("You do not have valid permissions for this operation : Create Folder"); }
      
  if ($action eq "copy" && $filename && $path && $target && $writeperms)
  { if (-e "$chroot$path/$target" && !-d "$chroot$path/$target") { set_error("You're trying to copy to a file that already exists!"); }
    else { copy("$chroot$path/$filename","$chroot$path/$target") ||  set_error("Unable to copy file. Does the document root directory have correct permissions? ($!)"); }
  }
  
  if ($action eq "copy" && $filename && $path && $target && !$writeperms)
  { set_error("You do not have valid permissions for this operation : Copy File"); }
  
  if ($action eq "delete" && $filename && $path && $writeperms)
  { if (!-e "$chroot$path/$filename") { set_error("You're trying to delete a file that doesn't exist!"); }
     else { unlink("$chroot$path/$filename") || set_error("Unable to delete file. Does the document root directory have correct permissions? ($!)"); }
  }

  if ($action eq "delete" && $filename && $path && !$writeperms)  
  { set_error("You do not have valid permissions for this operation : Delete File"); }
      
  if ($action eq "rename" && $filename && $path && $target && $writeperms)
  { if (-e "$chroot$path/$target" && !-d "$chroot$path/$target") { set_error("You're trying to rename to a filename that already exists!"); }
    else { rename("$chroot$path/$filename","$chroot$path/$target") || set_error("Unable to rename file. Does the document root directory have correct permissions? ($!)"); }
  }

  if ($action eq "rename" && $filename && $path && $target && $writeperms)  
  { set_error("You do not have valid permissions for this operation : Rename File"); }    

  my $list = "";  
  
  if (!$readperms)  
  { set_error("You do not have valid permissions for this operation : Read Folder Contents"); $list = $error; } 
    
  if ($readperms)
  { opendir(DIR,$chroot.$path) || set_error("Unable to read folder $chroot$path. Does the document root directory have correct permissions? ($!)"); 
    my $sort = $request->param("sort") || "filename";
    my @files = readdir(DIR);
    my %files = ();
    closedir(DIR);
    @files = grep { $_ !~ /^\.\.?$/ } @files;
    for(@files)
    { next if (!-d $chroot.$path."/".$_ and !-f $chroot.$path."/".$_);
      my $type = -d $chroot.$path."/".$_ ? "folder.jpg" : "file.jpg";
      my (@stat) = stat($chroot.$path."/".$_);
      $stat[7] = '-' if $type eq "folder.jpg";    
      my $date = scalar(localtime($stat[9]));
      $files{$_} = { type => $type, fullpath => $chroot.$path."/".$_, size => $stat[7], date => $stat[9], localtime => $date };
    }
    my @sorted = ();
    if ($sort =~ /^filename/)
    { @sorted = sort { $files{$b}{type} cmp $files{$a}{type} || $a cmp $b } @files; }

    if ($sort =~ /^date/)
    { @sorted = sort { $files{$b}{date} <=> $files{$a}{date} || $a cmp $b } @files; }

    if ($sort =~ /^size/)
    { @sorted = sort { $files{$b}{size} <=> $files{$a}{size} || $a cmp $b } @files; }

    if ($sort =~ /^(filename|date|size)r$/) { @sorted = reverse @sorted; }

    my $datesort = $sort ne "date" ? "date" : "dater";
    my $sizesort = $sort ne "size" ? "size" : "sizer";
    my $filenamesort = $sort ne "filename" ? "filename" : "filenamer";
  
    $list = <<EOF;
<div class="dialog" id="upload"><img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById('upload').style.display='none';"><br><form name="uploadform" method="post" action="<?SPINE_Location?>admin/file" enctype="multipart/form-data">&nbsp;&nbsp;Upload in path : $path&nbsp;&nbsp;<input type="hidden" name="path" value="$path"><input type="hidden" name="action" value="upload"><input type="file" name="filename">&nbsp;<input type="submit" class="button" value="Upload"></form></div>
<div class="dialog" id="createfolder"><img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById('createfolder').style.display='none';"><br><form name="createform" method="post" action="<?SPINE_Location?>admin/file" enctype="multipart/form-data">&nbsp;&nbsp;Create Folder in path : $path&nbsp;&nbsp;<input type="hidden" name="path" value="$path"><input type="hidden" name="action" value="createfolder"><input type="hidden" name="filename" value=""><input type="text" name="foldername">&nbsp;<input type="submit" class="button" value="Create"></form></div>
<div class="dialog" id="copy"><img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById('copy').style.display='none';"><br><form name="copyform" method="post" action="<?SPINE_Location?>admin/file" enctype="multipart/form-data">&nbsp;&nbsp;Copy <input type="text" name="filefield" value="" disabled>&nbsp; to &nbsp;<input type="hidden" name="path" value="$path"><input type="hidden" name="action" value="copy"><input type="text" name="target"><input type="hidden" name="filename" value="">&nbsp;<input type="submit" class="button" value="Copy" onClick='document.copyform.filename.value = document.myform.filename.value; return true;'></form></div>
<div class="dialog" id="rename"><img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById('rename').style.display='none';"><br><form name="renameform" method="post" action="<?SPINE_Location?>admin/file" enctype="multipart/form-data">&nbsp;&nbsp;Rename <input type="text" name="filefield" value="" disabled>&nbsp; to &nbsp;<input type="hidden" name="path" value="$path"><input type="hidden" name="action" value="rename"><input type="text" name="target"><input type="hidden" name="filename" value="">&nbsp;<input type="submit" class="button" value="Rename" onClick='document.renameform.filename.value = document.myform.filename.value; return true;'></form></div>
<div class="dialog" id="delete"><img border="0" align="right" valign="top" src="/images/delete.png" onclick="document.getElementById('delete').style.display='none';"><br><form name="deleteform" method="post" action="<?SPINE_Location?>admin/file" enctype="multipart/form-data">&nbsp;&nbsp;Delete <input type="text" name="filefield" value="" disabled><input type="hidden" name="path" value="$path"><input type="hidden" name="action" value="delete"><input type="hidden" name="filename" value="">&nbsp;<input type="submit" class="button" value="Delete" onClick='document.deleteform.filename.value = document.myform.filename.value; return true;'></form></div>

$error
<table width="100%" border="0" bgcolor="#ffffff" cellpadding="0" cellspacing="0" id="radiotable" class="unselected">

<tr width="100%"><form name="myform" method="post"><td>Path : $path<input type="hidden" name="path" value="$path"><input type="hidden" name="filename" value=""></td><td colspan="3">
<a href="#" onclick="
a=document.getElementById('createfolder'); if(a.style.display=='inline'){a.style.display='none';} 
a=document.getElementById('rename'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('copy'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('delete'); if(a.style.display=='inline'){a.style.display='none';}
o=document.getElementById('upload'); if(o.style.display=='inline'){o.style.display='none';}else{o.style.display='inline';} return false;">Upload File</a>
&nbsp;
<a href="#" onclick="
a=document.getElementById('upload'); if(a.style.display=='inline'){a.style.display='none';} 
a=document.getElementById('rename'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('copy'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('delete'); if(a.style.display=='inline'){a.style.display='none';}
o=document.getElementById('createfolder'); if(o.style.display=='inline'){o.style.display='none';}else{o.style.display='inline';} return false;">Create Folder</a>
&nbsp;
<a href="#" onclick="
a=document.getElementById('upload'); if(a.style.display=='inline'){a.style.display='none';} 
a=document.getElementById('createfolder'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('copy'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('delete'); if(a.style.display=='inline'){a.style.display='none';}
o=document.getElementById('rename'); if(o.style.display=='inline'){o.style.display='none';}else{o.style.display='inline';} document.renameform.filefield.value = '$path/'+document.myform.filename.value;return false;">Rename</a>
&nbsp;
<a href="#" onclick="
a=document.getElementById('upload'); if(a.style.display=='inline'){a.style.display='none';} 
a=document.getElementById('rename'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('createfolder'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('delete'); if(a.style.display=='inline'){a.style.display='none';}
o=document.getElementById('copy'); if(o.style.display=='inline'){o.style.display='none';}else{o.style.display='inline';} document.copyform.filefield.value = '$path/'+document.myform.filename.value;return false;">Copy</a>
&nbsp;
<a href="#" onclick="
a=document.getElementById('upload'); if(a.style.display=='inline'){a.style.display='none';} 
a=document.getElementById('rename'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('copy'); if(a.style.display=='inline'){a.style.display='none';}
a=document.getElementById('createfolder'); if(a.style.display=='inline'){a.style.display='none';}
o=document.getElementById('delete'); if(o.style.display=='inline'){o.style.display='none';}else{o.style.display='inline';} document.deleteform.filefield.value = '$path/'+document.myform.filename.value;return false;">Delete</a>
</td></tr>

<tr width="100%"><td width="35%"><a href="<?SPINE_Location?>admin/file/?path=$path&sort=$filenamesort">Filename</a></td><td align="center" width="10%"><a href="<?SPINE_Location?>admin/file/?path=$path&sort=$sizesort">Size</td><td align="center" width="20%"><a href="<?SPINE_Location?>admin/file/?path=$path&sort=$datesort">Date</td><td width="35%">&nbsp;</td></tr>
EOF

  if ($path ne $chroot)
  { my $backdir = $path;
    $backdir =~ s/\/$//;
    $backdir =~ s/^(.*)\/.*$/$1/;
   $list .= 
<<EOF;
<tr class="unselected" disabled>
<td>
<input type="radio">
<a href="<?SPINE_Location?>admin/file/?path=$backdir"><img src="/images/folder.jpg" border="0"> ..</a></td>
<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
</tr>
EOF

  }

  my $i = 0;
  for(@sorted)
  { $i++;
    if ($files{$_}{type} eq "file.jpg") 
    { $list .= 
<<EOF;
<tr>
<td>

<input type="radio" name="" onClick='document.myform.filename.value = "$_";' value="$_">
<img src="/images/$files{$_}{type}" border="0"> $_</td>
<td align="center">$files{$_}{size}</td><td align="center">$files{$_}{localtime}</td>
<td>&nbsp;</td>
</tr>
EOF

    } else
    {     $list .= 
<<EOF;
<tr>
<td>
<input type="radio" name="check$i" disabled>
<a href="<?SPINE_Location?>admin/file/?path=$path/$_"><img src="/images/$files{$_}{type}" border="0"> $_</a></td>
<td align="center">-</td><td align="center">$files{$_}{localtime}</td>
<td>&nbsp;</td>
</tr>
EOF
 
    }
  }

  $list .= "</table></form>";
}
  my $content = SPINE::Base::Content->new({style=>".admin",body=>$list, title=>"File Manager"});
  return $content;
}

sub set_error { $error = shift @_; }

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
