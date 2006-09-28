package SPINE::Base::Adminaccess;

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

@NUMERIC = qw( id );
@NON_NUMERIC = qw( section usergroup permissions );

# Admin Access Constructor

for (@NUMERIC, @NON_NUMERIC)
{ $fields{$_}++; } 

sub AUTOLOAD {
 my $self = shift;
 my $method = $AUTOLOAD;
 $method =~ s/.*:://mx;
 return if $method eq "DESTROY";
 carp "Invalid method: $method" unless $fields{$method};
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


1;
__END__

=pod

=head1 NAME

SPINE::Base::Adminaccess

=head1 DESCRIPTION

This is the Administration Access base class for SPINE.

SPINE uses abstract classes to pass data from and to the database module and the handler. 

This class handles the group-based permissions in the administration level. 
This class is usually used in combination with SPINE::DBI::AdminAccess.

=head1 SYNOPSIS

 use SPINE::DBI::AdminAccess;
 use SPINE::Constant; #Contains READACCESS, WRITEACCESS and EXECACCESS bitmasks

 my $dbi_adminaccess = SPINE::DBI::AdminAccess->new($dbh); #Database handler
 my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) }; #Username
 @usergroups = map { $_ = $_->usergroup } @usergroups;
 my @adminaccess = (); #This array will contain instances of SPINE::Base::AdminAccess
 for(@usergroups)
 { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'content'}) }); }
 my %permissions = ();
 for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; } #Logical OR

 $readperms = $adminaccess & READACCESS;
 $readperms =~ s/0//g;
 $writeperms = $adminaccess & WRITEACCESS;
 $writeperms =~ s/0//g;
 $execperms = $adminaccess & EXECACCESS;
 $execperms =~ s/0//g;

 if($execperms)
 { #You have Execution Permissions
 }

=head1 SYNTAX

All these attributes are object based getter/setter functions.

 $adminaccess->id

This attribute is only used for Database purposes.

 $adminaccess->section

This attribute indicates which administration section the permissions apply to.

 $adminaccess->usergroup

This attribute indicates which usergroup the permissions apply to.

 $adminaccess->permissions

This attribute indicates what permissions are defined for which usergroup for which administration section. This is usually a bitmask which is logically OR'ed with permissions from SPINE::Constant. Permissions are usually 3 bits long.
Permissions bitmask is usually defined as RWX. 100 is Read set and write and execution not set.

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
