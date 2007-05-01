package SPINE::DBI::Session;

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
use SPINE::Base::User;
use SPINE::Constant;
use Carp;

use base qw(SPINE::DBI::Base);
use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub new
{ my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self = {};
  $self->{_HANDLER} = shift; #Database handler
  $self->{TABLE} = "session";
  $self->{MODULE} = "Session";
  $self->{ORDER} = "id";
  $self->{GROUP} = "id";
  $self->{NUMERIC} = [@SPINE::Base::Session::NUMERIC];
  $self->{NON_NUMERIC} = [@SPINE::Base::Session::NON_NUMERIC];
  $self->{FIELDS} = [qw(id username sessiondate expires host)];
  bless $self,$class;
  return $self;
}

sub add
{ my $self = shift;
  my $record = shift;
  if(ref $record eq "SPINE::Base::$self->{MODULE}")
  { my $add = "insert into $self->{TABLE} (id, username, sessiondate, expires, host) values ( "; 
    my (%record) = $record->tohash;
    for my $field (@{$self->{FIELDS}}) 
    { #if($field eq 'id') { next; } 
      if (grep { $_ eq $field } @{$self->{NUMERIC}}) 
      { ($record{$field}) = $record{$field} =~ /(\d*)/mx; $add .= "$record{$field}, "; }
      if (grep { $_ eq $field } @{$self->{NON_NUMERIC}}) 
      { $add .= $self->{_HANDLER}->quote($record{$field}).", "; } 
    }
    chop $add; chop $add;
    $add .= " )";
    my $sth = $self->{_HANDLER}->prepare($add);
    $sth->execute();
  }
  return;
}

sub get
{ my $self = shift;
  my $id = "";
  my %params = ();
  my $sortfield = $self->{ORDER}; 
  my $searchtype = 'AND'; 
  if (@_) 
  { my $ref = shift;
    if (ref $ref eq 'ARRAY') 
    { %params = @{$ref}; } 
    elsif (ref $ref eq 'HASH')
    { %params = %{$ref}; }
    elsif (ref $ref eq '')
    { unshift @_,$ref;
      if (!(@_ % 2)) 
      { %params = @_; }
      else
      { $id = shift; }
    }
    $sortfield = $params{'sort'} || $self->{ORDER}; 
    delete($params{'sort'});
    $searchtype = $params{'searchtype'} || 'AND';
    delete($params{'searchtype'}); 
  }
  if($id) 
  { #($id) = $id =~ /(\d*)/mx;
    my $statement = "select * from $self->{TABLE} where id = '$id'";
    my $sth = $self->{_HANDLER}->prepare($statement);
    $sth->execute();
    my $record; 
    eval qq{ use SPINE::Base::$self->{MODULE}; \$record = SPINE::Base::$self->{MODULE}->new(\$sth->fetchrow_hashref()); };
    carp join("_-_",caller).$@ if $@;
    $sortfield = "";
    return $record;  
  } 
  if (!$id && %params) 
  { my @fields = keys %params;
    my $narrow;
    my $field;
    my $found;
    while($field = shift @fields) 
    { $found = "";
      if( grep { $field eq $_ } @{$self->{NUMERIC}} ) 
      { ($params{$field}) = $params{$field} =~ /(\d*)/mx;
        $narrow .= " $field = $params{$field}"; 
        $found++;
      }
      if( grep { $field eq $_ } @{$self->{NON_NUMERIC}} )
      { $narrow .= " $field = ".$self->{_HANDLER}->quote($params{$field}); 
        $found++;
      } 
      if($fields[0] && $found) { $narrow .= " $searchtype "; }
    }
    $narrow = "where $narrow" if $narrow;
    ($sortfield) = $sortfield =~ /(\w*)/mx;
    my $statement = "select * from $self->{TABLE} $narrow order by $sortfield";
    my $sth = $self->{_HANDLER}->prepare($statement); 
    $sth->execute();
    my $record = "";
    my $hashref = "";
    my @records = ();
    while($hashref = $sth->fetchrow_hashref()) 
    { eval qq{ use SPINE::Base::$self->{MODULE}; \$record = SPINE::Base::$self->{MODULE}->new(\$hashref); };
      carp join("_-_",caller).$@ if $@;
      push(@records,$record); 
    }
    $sortfield = "";
    return \@records;
  }
  my $statement = "select * from $self->{TABLE} order by $sortfield";
  my $sth = $self->{_HANDLER}->prepare($statement);
  $sth->execute();
  my $record = "";
  my $hashref = "";
  my @records = ();
  while($hashref = $sth->fetchrow_hashref())
  { eval qq{ use SPINE::Base::$self->{MODULE}; \$record = SPINE::Base::$self->{MODULE}->new(\$hashref); };
    carp join("_-_",caller).$@ if $@;
    push(@records,$record); 
  }
  return \@records;
}

sub remove
{ my $self = shift;
  my $id = shift;
  if (ref $id eq "SPINE::Base::$self->{MODULE}") { $id = $id->id; } 
  if ($id) 
  { #($id) = $id =~ /(\d*)/mx;
    my $sth = $self->{_HANDLER}->prepare("delete from $self->{TABLE} where id = '$id'");
    $sth->execute();
  }
  return;
}

1;
__END__

=pod

=head1 NAME

SPINE::DBI::Session

=head1 DESCRIPTION

This is the Session DBI class for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

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
