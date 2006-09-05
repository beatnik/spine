package SPINE::Transparent::Request;

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

use warnings;
use strict;
use vars qw($VERSION);
use Data::Dumper;

$VERSION = $SPINE::Constant::VERSION;

sub new {
 my $proto  = shift;
 my $class  = ref($proto) || $proto;
 my $self = {};
 $self->{REQUEST} = shift;
 if (ref($self->{REQUEST}) eq "Apache::Request")
 { eval qq|use Apache::Cookie; \$self->{COOKIES} = Apache::Cookie->fetch; |; 
   eval qq|use Apache::Request; \$self->{REMOTE_HOST} = \$self->{REQUEST}->get_remote_host(); |; 
  }
 if (ref($self->{REQUEST}) eq "Apache2::Request")
 { eval qq|use Apache2::Cookie; \$self->{COOKIES} = scalar Apache2::Cookie->fetch; |; 
   eval qq|use Apache2::Request; \$self->{REMOTE_HOST} = \$self->{REQUEST}->connection->get_remote_host(); |; 
 }
 bless $self,$class;
 return $self;
} 

sub request
{ my $self = shift;
  return $self->{REQUEST};
}

sub cookies
{ my $self = shift;
  return % { $self->{COOKIES} } if $self->{COOKIES};
}

sub remote_host
{ my $self = shift;
  return $self->{REMOTE_HOST};
}

1;

__END__

=pod

=head1 NAME

SPINE::Constant

=head1 DESCRIPTION

These are all the constants defined for SPINE.

Most of the constants defined in here are bitmasks.
Perform a bitwise AND on these bitmasks and a variable to retrieve the flags.

=head1 SYNOPSIS

 use SPINE::Constant;

 print $SPINE::Constant::VERSION;

 #Get $permissions from somwhere
 my $permissions = .... #Assume it contains 1010
 my $readgperms = $permissions & READPERMISSIONS;
 $readgperms =~ y/0//d;
 if($readperms) { print "You have read permissions"; }

=head1 VERSION

This is spine 1.2 beta.

=head1 AUTHOR

Hendrik Van Belleghem - b e a t n i k   a t   u s e r s  d o t  s f  d o t  n e t

=head1 LICENSE

SPINE is distributed under the GNU General Public License.

Read LICENSE for more information.

=head1 SEE ALSO

SPINE::*

Apache::Request

Apache::Cookie

http://spine.sf.net

=cut
