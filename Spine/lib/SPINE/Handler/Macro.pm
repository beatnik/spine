package SPINE::Handler::Macro;

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

#Request Handler
#DB Handler

use strict;

use SPINE::Constant;
use SPINE::DBI::Macro;

use Data::Dumper;

use vars qw($VERSION);
$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $r = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my $content = shift;
  my ($params) = $tag =~ m/\(([^\)]*)\)/mxg;
  my @params = split(/,/,$params);
  @params = map { /\"?([^\"]*)\"?/mx; $_ = $1; } @params;
  my $macro_dbi = SPINE::DBI::Macro->new($dbh);
  my $macro = shift @ { $macro_dbi->get({name=>$content->macros, macrokey=>$params[0], count=>1 }) };; 
  return $macro->macrovalue if ref $macro;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Macro

=head1 DESCRIPTION

This is the Macro Handler for SPINE.

This handler is currently not used.. a lot.

In the next release, this module will be linked to SPINE::Base::Macro.

=head1 SYNOPSIS - FOR NOW

 <?SPINE_Macro("SPINE_Version")?>

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
