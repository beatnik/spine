package SPINE::Handler::Stats;

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

use SPINE::DBI::Content;
use SPINE::DBI::Statistics;
use SPINE::DBI::Attribute;
use SPINE::Constant;
use Data::Dumper;

use strict;

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my $body = 0;
  my ($params) = $tag =~ m,\(([^\)]*)\),g;
  my @params = split(/,/,$params);

  my $main = $request->dir_config("main") || "index.html";
  my $stats_dbi = SPINE::DBI::Statistics->new($dbh);
  my $attributes_dbi = SPINE::DBI::Attribute->new($dbh);  
  my $content_dbi = SPINE::DBI::Content->new($dbh);  

  my @p = ();
  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//g;
  ($url,@p) = split("/",$url);
  if (!$url)
  { $url = $main; }

  if ($params[0] eq '"hits"')
  { my ($foo) = @{$attributes_dbi->get(name=>"counter",section=>"stats",attr=>$url, count=>1)};
    my %hash = ();
    %hash = %{$foo} if $foo;
    $body = $hash{'VALUE'} || 0;
  }
  
  if ($params[0] eq '"modified"')
  { my $foo = shift @{$content_dbi->get("name"=>$url, count=>1)}; 
    my %hash = %{$foo};
    $body = $hash{'MODIFIED'};
  }
  
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Stats

=head1 DESCRIPTION

This is the Statistics Handler for SPINE.

This handler will return general page statistics, like page visits or last modification date

=head1 SYNOPSIS

 <?SPINE_Stats("hits")?>

 <?SPINE_Stats("modified")?>

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
