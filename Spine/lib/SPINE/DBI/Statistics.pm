package SPINE::DBI::Statistics;

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

use strict;
use DBI;
use Data::Dumper;
use Carp;
use vars qw($VERSION);
use SPINE::Constant;

$VERSION = $SPINE::Constant::VERSION;

sub new
{ my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self = {};
  $self->{_HANDLER} = shift;
  bless $self,$class;
  return $self;
}

sub get
{ my $self = shift;
  my $field = shift;
  my $where = shift;
  $where = $where ? "where name = '$where'" : "";
  my $statement = "select $field, count($field) as number from statistics $where group by $field order by $field";
  my $sth = $self->{_HANDLER}->prepare($statement);
  $sth->execute();
  my @records = ();
  my $hashref = undef;
  while($hashref = $sth->fetchrow_hashref())
  { push(@records,$hashref); }
  return \@records;
}


sub getlist
{ my $self = shift;
  my $statement = "select distinct(name) from statistics order by name";
  my $sth = $self->{_HANDLER}->prepare($statement);
  $sth->execute();
  my $name;
  my @list;
  while( ($name) = $sth->fetchrow_array)
  { push(@list,$name); }
  return \@list;
}

sub remove
{ my $self = shift;
  my %rec = % { shift @_ };
  my $name = $rec{"name"};
  { my $sth = $self->{_HANDLER}->prepare("delete from statistics where name = \"$name\"");
    $sth->execute();
  }
  return;
}

1;
__END__

=pod

=head1 NAME

SPINE::DBI::Statistics

=head1 DESCRIPTION

This is the Statistics DBI class for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

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
