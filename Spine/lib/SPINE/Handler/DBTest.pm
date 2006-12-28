package SPINE::Handler::DBTest;

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

use SPINE::DBI::Attribute;
use SPINE::Transparent::Request;
use strict;

use vars qw($VERSION);

$VERSION = 1.1;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my $body = "";

  #This is the magic: Init SPINE::DBI::Attribute
  my $attributes_dbi = SPINE::DBI::Attribute->new($dbh);  
  
  #Retrieve the main page, by default index.html
  my $main = $request->dir_config("main") || "index.html";
  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//gmx;  
  ($url) = split("/",$url);
  #Clean up the URL a bit
  if (!$url)
  { $url = $main; }
  
  #Fetch from the attributes table the following value from the record with
  #name: counter 
  #section: stats
  #attribute: url
  #limit returned values to the first
  my ($foo) = @{$attributes_dbi->get(name=>"counter",section=>"stats",attr=>$url, count=>1)};
  my %hash = ();
  %hash = %{$foo} if $foo;
  $body = $hash{'VALUE'} || 0;
  #The value is stored in $hash{"VALUE"}
  
    
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::DBTest

=head1 DESCRIPTION

This is the Database driven plugin tutorial for SPINE.

This handler will return general page statistics, for demonstrational purposes.

=head1 SYNOPSIS

 <?SPINE_DBTest?>

=head1 VERSION

This is spine 1.2.

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
