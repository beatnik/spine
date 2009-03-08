package SPINE::Base::Session;

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

use vars qw($VERSION @NUMERIC @NON_NUMERIC %fields $AUTOLOAD);
use Carp;
use warnings;
no warnings 'redefine';
use strict;
use SPINE::Constant;

$VERSION = $SPINE::Constant::VERSION;

# Session Constructor

@NUMERIC = qw( );
@NON_NUMERIC = qw( id expires username sessiondate host );

for (@NUMERIC, @NON_NUMERIC)
{ $fields{$_}++; } 

# Session Methods

sub generate {
 my $self = shift;
 $self->id($self->randomkey);
 return $self->id();
}

sub randomkey { 
 my @chars = ("a".."z","A".."Z");
 return join("",@chars[map{ rand @chars} (1..32)]);
}

sub user {
 my $self = shift;
 if (@_)
 { $self->{_USERNAME} = shift; }
 return $self->{_USERNAME};
}

sub AUTOLOAD {
 my $self = shift;
 my $method = $AUTOLOAD;
 $method =~ s/.*:://mx;
 return if $method eq "DESTROY";
 carp "Invalid method! $method" unless $fields{$method};
 $_[0] =~ s/\s+$//mx if @_;
 $self->{uc $method} = shift if @_;
 return $self->{uc $method};
}

sub new {
 my $proto  = shift;
 my $class  = ref($proto) || $proto;
 my $self = {};
 bless($self, $class);
 if (@_) 
 { my $ref = shift;
   my %params = ();
   if (ref $ref eq 'ARRAY')
   { %params = @{$ref}; }
   if (ref $ref eq 'HASH')
   { %params = %{$ref}; }
   if (ref $ref eq '') 
   { unshift @_,$ref;
     if (!(@_ % 2)) 
     { %params = @_; }
   }
   for (keys %params) { next if !$params{$_};  $params{$_} =~ s/\s+$//; $self->{uc $_} = $params{$_} if defined $params{$_}; } 
 }
 return $self;
} 

sub tohash 
{ my $self = shift;
  my %hash = ();
  for(keys %{$self})
  { my $lc = lc $_; $hash{$lc} = $self->{$_}; }
  return (%hash);
}

1;
__END__

=pod

=head1 NAME

SPINE::Base::Session

=head1 DESCRIPTION

This is the Session base class for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.3 beta.

=head1 AUTHOR

Hendrik Van Belleghem - hendrik.vanbelleghem@gmail.com

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
