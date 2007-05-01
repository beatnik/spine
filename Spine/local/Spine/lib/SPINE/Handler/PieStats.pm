package SPINE::Handler::PieStats;

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

use strict;
use vars qw($VERSION);

use SPINE::Constant;
use GD::Graph::pie;
use SPINE::DBI::Statistics;

$VERSION = $SPINE::Constant::VERSION;

sub handler
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my $width = $request->param('width') || 450;
  my $height = $request->param('height') || 400;
  my $category = $request->param('category') || "useragent";
  my $page = $request->param('page') || "index.html";
  my ($params) = $tag =~ m/\(([^\)]*)\)/gmx;
  my @params = split(/,/,$params);
  my $stats_dbi = SPINE::DBI::Statistics->new($dbh);
  my @category = ();
  my @numbers = ();
  for my $list (@{$stats_dbi->get($category,$page)})
  { my %hash = %{$list};
    push(@category,$hash{$category});
    push(@numbers,$hash{"number"});
  }
  my @data = (\@category, \@numbers);
  my $pie = new GD::Graph::pie( $width, $height );

  $pie->set( 
	title => "Requests per $category",
	axislabelclr => 'black',
	pie_height => 36,

	l_margin => 15,
	r_margin => 15,

	start_angle => 235,
        show_values => 1,
	transparent => 0,
  );

  my $gd = $pie->plot(\@data);
  my $body = $gd->png;
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::PieStats

=head1 DESCRIPTION

This is the Pie Statistics Handler for SPINE.

This is an example for both a tag plugin and a content that uses a custom content type.

Read the developing.txt and alternative-datatypes.txt files for more information on these topics.

=head1 SYNOPSIS

 <?SPINE_PieStats?>

Make sure the content where you use this is empty, uses an empty style and has image/png set as the content type.

Pass parameters to the content to change the dimensions, the statistics category and the page. The statistical information is retrieved from the logging table in the database.
Suppose your content file is called graph_stat.png and contains that specific tag, calling it will generate a pie chart with default data source. You can change the page and the dimensions by passing parameters.

 graph_stat.png?page=index&category=useragent&width=640&height=480

=head1 REQUIREMENTS

This plugin requires the GD::Graph module. Fetch it from CPAN.

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
