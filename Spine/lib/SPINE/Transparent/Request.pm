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
 #return $proto if $class eq "SPINE::Transparent::Request";
 my $self = {};
 $self->{CONFIG} = ();
 $self->{REQUEST} = shift;
 if (ref($self->{REQUEST}) eq "Apache::Request")
 { eval qq|use Apache::Cookie; \$self->{COOKIES} = Apache::Cookie->fetch; |; 
   $self->{REMOTE_HOST} = $self->{REQUEST}->get_remote_host();
   $self->{LOCATION} = $self->{REQUEST}->location(); 
   $self->{DIR_CONFIG} = sub { $self->{REQUEST}->dir_config(@_); } ;
   $self->{URI} = $self->{REQUEST}->uri;
   $self->{REFERER} = $self->{REQUEST}->header_in("Referer");
   $self->{DOCUMENT_ROOT} = $self->{REQUEST}->document_root;
   $self->{METHOD} = $self->{REQUEST}->method;
  }
 if (ref($self->{REQUEST}) eq "Apache2::Request")
 { eval qq|use Apache2::Cookie; \$self->{COOKIES} = scalar Apache2::Cookie->fetch; |; 
   $self->{REMOTE_HOST} = $self->{REQUEST}->connection->get_remote_host();
   $self->{LOCATION} = $self->{REQUEST}->location(); 
   $self->{DIR_CONFIG} = sub { $self->{REQUEST}->dir_config(@_); };
   $self->{URI} = $self->{REQUEST}->uri;
   my $in = $self->{REQUEST}->headers_in(); $self->{REFERER} = $in->{"Referer"};
   $self->{DOCUMENT_ROOT} = $self->{REQUEST}->document_root;
   $self->{METHOD} = $self->{REQUEST}->method;
 }
 if (ref($self->{REQUEST}) eq "CGI")
 {  eval qq|use CGI::Cookie; \$self->{COOKIES} = scalar CGI::Cookie->fetch; |; 
    $self->{REMOTE_HOST} = $self->{REQUEST}->url();
    #$self->{URI} = $self->{LOCATION}."\/".$self->{REQUEST}->param("page");
	$self->{URI} = $self->{REQUEST}->path_info;
    $self->{DOCUMENT_ROOT} = $ENV{DOCUMENT_ROOT};
    $self->{METHOD} = $self->{REQUEST}->request_method();
 }
 bless $self,$class;
 return $self;
} 

sub param
{ my $self = shift;
  return $self->{REQUEST}->param(@_);
}

sub upload
{ my $self = shift;
  return $self->{REQUEST}->upload(@_);
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

sub document_root
{ my $self = shift;
  return $self->{DOCUMENT_ROOT};
}

sub dir_config
{ my $self = shift;
  if ($self->{CONFIG})
  { my %v = %{ $self->{CONFIG} };
    return $self->{CONFIG}{@_};
  }
  return $self->{DIR_CONFIG}(@_);
}

sub uri
{ my $self = shift;
  if (ref($self->{REQUEST}) eq "CGI")
  { $self->{URI} = $self->{REQUEST}->path_info; $self->{URI} =~ s/^\///; }
  return $self->{URI};
}

sub location
{ my $self = shift;
  if (@_)
  { $self->{LOCATION} = shift(@_); }
  return $self->{LOCATION};
}

sub referer
{ my $self = shift;
  return $self->{REFERER};
}

sub method
{ my $self = shift;
  return $self->{METHOD};
}

sub setconfig
{ my $self = shift;
  $self->{CONFIG} = {@_};
}
1;

__END__

=pod

=head1 NAME

SPINE::Transparent::Request

=head1 DESCRIPTION

This package handles the transparency between requests to Apache::Request, Apache2::Request and CGI.pm

=head1 SYNOPSIS

=head1 VERSION

This is spine 1.3 beta.

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
