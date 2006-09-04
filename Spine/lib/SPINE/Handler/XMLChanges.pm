package SPINE::Handler::XMLChanges;

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
use strict;
use vars qw($VERSION);

use Time::Local qw(timelocal);
use Data::Dumper;

use SPINE::Constant;
use SPINE::DBI::Content;

$VERSION = $SPINE::Constant::VERSION;

sub handler
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my ($params) = $tag =~ m,\(([^\)]*)\),g;
  my @params = split(/,/,$params);
  my $body = undef;
  my $since = $request->param("since") || "1980-01-01 00:00:00";
  my (@since_time) = $since =~ /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2})\:(\d{2})\:(\d{2})$/;
  $since_time[1]--;
  my $since_time = timelocal($since_time[5],$since_time[4],$since_time[3],$since_time[2],$since_time[1],$since_time[0]);
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  for my $content (@{$content_dbi->get("sort"=>"modified")})
  { my @mod_time = $content->modified =~ /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2})\:(\d{2})\:(\d{2})$/;
    $mod_time[1]--;
    my $mod_time = timelocal($mod_time[5],$mod_time[4],$mod_time[3],$mod_time[2],$mod_time[1],$mod_time[0]);
    if ($mod_time > $since_time)
    { my $name = $content->name;
      my $modified = $content->modified;
      $body .= qq(<content name="$name" modified="$modified"/>\n); }
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::XMLChanges

=head1 DESCRIPTION

This is a SPINE plugin that generates an XML feed of the last changed contents.

This is an example for both a tag plugin and a content that uses a custom content type.

Read the developing.txt and alternative-datatypes.txt files for more information on these topics.

=head1 SYNOPSIS

 <?SPINE_XMLChanges?>

In the content...

 <changes>
 <?SPINE_XMLChanges?></changes>

In the style, you usually define basic XML header, something like :

 <?xml version="1.0"?>
 <?SPINE_Content?>

Set the content-type for your content to text/xml.

Pass the date as a parameter to show changes since that specific date.

 changes.xml?since2005-01-01%2012:20:15

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
