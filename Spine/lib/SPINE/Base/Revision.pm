package SPINE::Base::Revision;

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
use strict;
use Carp;
use warnings;
no warnings 'redefine';
use SPINE::Constant;

$VERSION = $SPINE::Constant::VERSION;

@NUMERIC = qw( id super_version sub_version );
@NON_NUMERIC = qw( name body changetype modified owner address );

for (@NUMERIC, @NON_NUMERIC)
{ $fields{$_}++; } 

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
   for (keys %params) { $self->{uc $_} = $params{$_} if defined $params{$_}; } 
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

sub snapshot
{ my $self = shift;
  $self->{SUPER_VERSION}++;
  return $self->{SUPER_VERSION};
}

sub revise
{ my $self = shift;
  $self->{SUB_VERSION}++;
  return $self->{SUB_VERSION};
}

sub default 
{ my ($sec,$min,$hour,$day,$mon,$year) = localtime;
  $mon++; $year += 1900;
  return SPINE::Base::Revision->new(
        {id=>0,
         owner=>'admin',
         name=>"Empty",
         changetype=>"",
         body=>"", 
         modified => "$year-$mon-$day $hour:$min:$sec",
	 super_version => 0,
	 sub_version => 0,
         });
}

sub AUTOLOAD {
 my $self = shift;
 my $method = $AUTOLOAD;
 $method =~ s/.*:://mx;
 return if $method eq "DESTROY";
 carp "Invalid method: $method" unless $fields{$method};
 $self->{uc $method} = shift if @_;
 return $self->{uc $method};
}

1;
__END__

=pod

=head1 NAME

SPINE::Base::Revision

=head1 DESCRIPTION

This is the Revision for the Wiki class for spine.

SPINE uses abstract classes to pass data from and to the database module and the handler. 

=head1 SYNOPSIS

 use SPINE::DBI::Revision

 my $revision_dbi = SPINE::DBI::Revision->new($dbh); #Database handler
 my $revision = shift @{$revision_dbi->get({name=>"index.html"})}; 
 if (!ref $revision) { $revision = SPINE::Base::Revision::default(); 

 #Version is now 0.01
 $revision->revise;
 #Version is now 0.02
 
 $revision->snapshot;
 #Version is now 1.02

 #Print the body
 print $revision->body;

 #Dump the revision to a hash
 my %hash = revision->tohash;

=head1 SYNTAX

All these attributes are object based getter/setter functions.

 $revision->id

This attribute is only used for Database purposes.

 $revision->name

This attribute sets the filename of this page. For example 'Leonardo Da Vinci'.

 $revision->title

This attribute sets the title of this page.

 $revision->body

This attribute defines the changes

 $revision->modified

This attribute will contain the last modification date of this page.

 $revision->owner

This attribute will contain the owner name of the page. This is used for the access permissions.

 $revision->default

This method returns the default values for the page. This can be used to capture any invalid instances.

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
