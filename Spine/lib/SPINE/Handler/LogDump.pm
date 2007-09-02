package SPINE::Handler::LogDump;

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
use SPINE::DBI::Statistics;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; 
  my $body = "";
  my $sth = $dbh->prepare("select * from statistics order by sdate");
  $sth->execute;
  my %hash = ();
  my $hash = undef;
  while($hash =$sth->fetchrow_hashref)
  { %hash = %{$hash} if $hash; $body .= qq($hash{remoteaddr} - - [$hash{sdate}] "GET /$hash{name} HTTP/1.0" 200 1024\n) if $hash; }
  # Common
  # $remoteaddr - - [$sdate] "GET /$name HTTP/1.O" 200 $size" #

  # Combined
  # $remoteaddr - - [$sdate] "GET /$name HTTP/1.O" 200 $size" "$referer" "$useragent" #
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::LogDump

=head1 DESCRIPTION

This is a Log Dumper plugin for SPINE.

=head1 SYNOPSIS

 <?SPINE_LogDump?>

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
