package SPINE::Handler::ImageGallery;

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

#Apache::Request Handler
#DB Handler

use warnings;

use SPINE::Constant;
use SPINE::DBI::Content;
use SPINE::DBI::Message;
use SPINE::DBI::Messagegroup;
use SPINE::Base::Messagegroup;
use SPINE::Base::Message;
use URI::Escape;

use strict;

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my $body;
  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//g;
  ($url) = split("/",$url);

  my ($params) = $tag =~ m,\(([^\)]*)\),g;
  my @params = split(/,/,$params);
  my $dir = shift @params;
  my $images = $request->document_root.$location;
  my $message_dbi = SPINE::DBI::Message->new($dbh);
  ($dir) = $dir =~ /\"?([^\"]*)\"?/;
  $dir = $request->param("dir") || $dir;
  $dir =~ s/[;\`'!\?\@\|\"\*~<>\^\[\]\{\}\$\n\f\a\r\0\t\s]+//g;
  my $pic = shift @params;
  ($pic) = $pic =~ /\"?([^\"]*)\"?/;
  $pic ||= $request->param("pic");
  $pic =~ s/[;\`'!\?\@\|\"\*~<>\^\[\]\{\}\$\n\f\a\r\0\t\s]+//g; 
  if ($request->param('name') && $request->param('comment') && $request->param('pic') && $request->param('dir'))
  { my ($sec,$min,$hour,$mday,$mon,$year) = localtime;
    $year += 1900;
    $mon++;
    my $date = "$year-$mon-$mday $hour:$min:$sec";
    my $messagegroup_dbi = SPINE::DBI::Messagegroup->new($dbh);
    my $messagegroup = shift @{ $messagegroup_dbi->get({name=>scalar($request->param('dir')), count=>1}) } ; 
    if (!$messagegroup)
    { $messagegroup_dbi->add(SPINE::Base::Messagegroup->new({id=>0,name=>scalar($request->param('dir')), content=>'.message', owner=>"admin", usergroup=>"users", permissions=>'111111'}));}
    my $new_id = $message_dbi->add(SPINE::Base::Message->new(
    { id=>0,
      mgroup=>scalar $request->param('dir'),
      subject=>scalar $request->param('pic'),
      owner=>scalar $request->param('name'),
      mdate=>$date,
      parent=>0,
      body=>scalar $request->param('comment'),
    }  ));
  }
  if ($dir && !$pic)
  { opendir(DIRECTORY,"$images/$dir") || die "$images/$dir : $!";
    my @files = readdir(DIRECTORY);
    shift @files; shift @files;
    @files = sort { $a cmp $b } @files;
    $body = "<table width=\"500\"><tr>\n";
    my $foo = 0;
    for(@files)
    { if ($_ =~ /^\./) { next; }
      my $thumb = $_;
      if ($foo > 4) { $body .= "</tr><tr>\n"; $foo = 0; }
      $foo++;
      $thumb =~ s/(\.JPE?G)$/_low$1/i; $thumb =~ s/(\.PNG)$/_low$1/i;
      if (-d "$images/$dir/$_")
      { $body .= qq(<td align="center"><a href="$url?dir=$dir/$_">\n<img src="/images/folder.png">\n<br>$_</a></td>); next; }
      if ($_ =~ /.*\.png$/i || $_ =~ /.*\.jpe?g$/i) 
      { my $f = $_; $f = uri_escape($_); $body .= qq(<td align="center"><a href="$url?dir=$dir&pic=$f">\n<img src="$location/$dir/.thumbs/$thumb">\n<br>$_</a></td>); next; }
    }
    $body .= "</tr></table>";
    closedir(DIRECTORY);
  }
  if ($dir && $pic)
  { opendir(DIRECTORY,"$images/$dir") || die $!;
    my @files = readdir(DIRECTORY);
    shift @files; shift @files;
    @files = grep { /\.(jpe?g|gif|png)$/i } @files;
    @files = sort { $a cmp $b } @files;
    closedir(DIRECTORY);
    my ($prev,$next,$i);
    for(@files) { if($_ eq $pic) { $prev = $files[$i-1]; $next = $files[$i+1]; last; } $i++; }
    $body = qq([ <a href="$url?dir=$dir&pic=$files[0]">First</a> ]);
    if ($prev && $prev ne $files[$#files+1]) { $body .= qq([ <a href="$url?dir=$dir&pic=$prev">Previous</a> ]); }
    $body .= qq([ <a href="$url?dir=$dir">Index</a> ]);
    if ($next && $next ne $files[0]) { $body .= qq([ <a href="$url?dir=$dir&pic=$next">Next</a> ]); }
    $body .= qq([ <a href="$url?dir=$dir&pic=).$files[-1].qq(">Last</a> ]);
    if ($body) { $body .= "<br>"; }
    my $f = $_; $f = uri_escape($_);
    $body .= qq(<img src="$dir/$pic"><br><form method="get" action="$url"><input type="hidden" name="dir" value="$dir"><input type="hidden" name="pic" value="$pic">Your name: <input type="text" name="name"><br>Comments:<br><textarea rows="10" cols="40" name="comment"></textarea><br><input type="submit" value="Done"></form><br><?SPINE_Message("$dir","","$pic")?>\n); }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::ImageGallery

=head1 DESCRIPTION

This is the Image Gallery plugin for SPINE.

The Images and thumbnails for this plugin are retrieved from:

DOCUMENT_ROOT/spine_path/directory

The Document root is an Apache configuration variable and can be configured per location section.

The SPINE Path is your location

The directory is either passed as a parameter to the SPINE tag or as a parameter in the URL ( gallery.html?dir=Holiday%20Pics )

=head1 SYNOPSIS

<?SPINE_ImageGallery?>

<?SPINE_ImageGallery("directory")?>

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

