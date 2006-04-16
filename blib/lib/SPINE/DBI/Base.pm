package SPINE::DBI::Base;

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
use vars qw($VERSION $DEBUGTABLE);

use SPINE::Constant;

$VERSION = $SPINE::Constant::VERSION;

sub new
{ my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self = {};
  $self->{_HANDLER} = shift;
  $self->{TABLE} = "";
  $self->{MODULE} = "";
  $self->{ORDER} = 'name';
  $self->{GROUP} = 'name';
  $self->{NUMERIC} = [];
  $self->{NON_NUMERIC} = [];
  $self->{FIELDS} = [];  
  bless $self,$class;
  return $self;
}

sub get
{ my $self = shift;
  my $id = "";
  my %params = ();
  my $count = 0;
  my $limit = undef;
  my $offset = undef;  
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
    $count = $params{'count'};
    delete($params{'count'}); 
    $limit = $params{'limit'};
    delete($params{'limit'});
    $offset = $params{'offset'} || 0;
    delete($params{'offset'});         
  }
  if($id) 
  { ($id) = $id =~ /(\d*)/;
    my $statement = "select * from $self->{TABLE} where id = ?";
    if ($self->{_HANDLER}->{Driver}->{Name} eq "mysql")
    { if (defined($limit) && defined($offset))
      { $statement .= " limit $offset, $limit"; }
    }
    if ($self->{_HANDLER}->{Driver}->{Name} eq "Pg")
    { $statement .= " limit $limit" if defined($limit);
      $statement .= " offset $offset" if defined($offset);    
    }
    my $sth = $self->{_HANDLER}->prepare($statement);
    $sth->execute($id);
    my $record; 
    eval qq{ use SPINE::Base::$self->{MODULE}; \$record = SPINE::Base::$self->{MODULE}->new(\$sth->fetchrow_hashref()); };
    warn join("_-_",caller).$@ if $@;
    $sortfield = "";
    $sth->finish;
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
      { ($params{$field}) = $params{$field} =~ /(\d*)/;
        $narrow .= " $field = $params{$field}"; 
        $found++;
      }
      if( grep { $field eq $_ } @{$self->{NON_NUMERIC}} )
      { $narrow .= " $field = ".$self->{_HANDLER}->quote($params{$field}); 
        $found++;
      } 
      if($fields[0] && $found) { $narrow .= " $searchtype "; }
    }
    $narrow = "where$narrow" if $narrow;
    #($sortfield) = $sortfield =~ /(\w*)/;
    my $statement = "select * from $self->{TABLE} $narrow order by $sortfield";
    if ($self->{_HANDLER}->{Driver}->{Name} eq "mysql")
    { if (defined($limit) && defined($offset))
      { $statement .= " limit $offset, $limit"; }
    }
    if ($self->{_HANDLER}->{Driver}->{Name} eq "Pg")
    { $statement .= " limit $limit" if defined($limit);
      $statement .= " offset $offset" if defined($offset);    
    }
    warn $statement if $SPINE::DBI::Base::DEBUGTABLE eq $self->{TABLE};
    my $sth = $self->{_HANDLER}->prepare($statement); 
    $sth->execute();
    my $record = "";
    my $hashref = "";
    my @records = ();
    my $i = 0;
    while($hashref = $sth->fetchrow_hashref()) 
    { eval qq{ use SPINE::Base::$self->{MODULE}; \$record = SPINE::Base::$self->{MODULE}->new(\$hashref); };
      warn join("_-_",caller).$@ if $@;
      push(@records,$record); 
      $i++;
      last if $i == $count;
    }
    $sortfield = "";
    return \@records;
  }
  my $statement = "select * from $self->{TABLE} order by $sortfield";
  if ($self->{_HANDLER}->{Driver}->{Name} eq "mysql")
  { if (defined($limit) && defined($offset))
    { $statement .= " limit $limit, $offset"; }
  }
  if ($self->{_HANDLER}->{Driver}->{Name} eq "Pg")
  { $statement .= " limit $limit" if defined($limit);
    $statement .= " offset $offset" if defined($offset);    
  }
  my $sth = $self->{_HANDLER}->prepare($statement);
  $sth->execute();
  my $record = "";
  my $hashref = "";
  my @records = ();
  my $i = 0;
  while($hashref = $sth->fetchrow_hashref())
  { eval qq{ use SPINE::Base::$self->{MODULE}; \$record = SPINE::Base::$self->{MODULE}->new(\$hashref); };
    join("_-_",caller).$@ if $@;
    push(@records,$record); 
    $i++;
    last if $i == $count;
  }
  $sth->finish;
  return \@records;
}

sub getlist
{ my $self = shift;
  my $id = "";
  my %params = ();
  my $sortfield = $self->{ORDER}; 
  my $field = $self->{GROUP};
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
    $sortfield = $params{'sort'} || $sortfield; 
    delete($params{'sort'});
    $field = $params{'field'} || $field;
    delete($params{'field'});
    $searchtype = $params{'searchtype'} || $searchtype;
    delete($params{'searchtype'}); 
  }
  $field = "distinct($field)";
  if (%params) 
  { my @fields = keys %params;
    my $narrow = '';
    my $foo = '';
    my $found = '';
    while($foo = shift @fields) 
    { $found = "";
      if( grep { $foo eq $_ } @{$self->{NUMERIC}} ) 
      { ($params{$foo}) = $params{$foo} =~ /(\d*)/;
        $narrow .= " $foo = $params{$foo}"; 
        $found++;
      }
      if( grep { $foo eq $_ } @{$self->{NON_NUMERIC}} )
      { $narrow .= " $foo = ".$self->{_HANDLER}->quote($params{$foo}); 
        $found++;
      } 
      if($fields[0] && $found) { $narrow .= " $searchtype "; }
      #If there are still fields in @fields and there is already a match, use searchtype to bind the results
      $narrow = "where $narrow" if $narrow;
    }
    ($sortfield) = $sortfield =~ /(\w*)/;
    my $statement = "select $field from $self->{TABLE} $narrow order by $sortfield";
    my $sth = $self->{_HANDLER}->prepare($statement); 
    $sth->execute();
    my $f = "";
    my @records = ();
    while (($f)  = $sth->fetchrow_array()) 
    { push(@records,$f); }
    $sortfield = "";
    $sth->finish;
    return \@records;
  }
  $sortfield = "order by $sortfield" if $sortfield;
  my $statement = "select $field from $self->{TABLE} $sortfield";
  my $sth = $self->{_HANDLER}->prepare($statement);
  $sth->execute();
  my $f = "";
  my @records = ();
  while(($f) = $sth->fetchrow_array())
  { push(@records,$f); }
  $sth->finish;
  return \@records;
}

sub update
{ my $self = shift;
  my $record = shift;
  if(ref $record eq "SPINE::Base::$self->{MODULE}") 
  { my $update = '';
    my %record = $record->tohash;
    for(@{$self->{NUMERIC}}) 
    { if($_ eq 'id') { next; } 
      ($record{$_}) = $record{$_} =~ /(\d*)/;
      $update .= "$_ = $record{$_}, ";
    }
    for(@{$self->{NON_NUMERIC}})  
    { if($_ eq 'name') { next; } 
      $update .= "$_ = ".$self->{_HANDLER}->quote($record{$_}).", "; 
    }
    chop $update; chop $update; 
    $update .= " where id = $record{id}"; 
    my $sth = $self->{_HANDLER}->prepare("update $self->{TABLE} set $update");
    $sth->execute();
    $sth->finish;
  }
}

sub add
{ my $self = shift;
  my $record = shift;
  my $id = undef;
  if(ref $record eq "SPINE::Base::$self->{MODULE}")
  { my @fields = grep { $_ ne "id" } @{$self->{FIELDS}};
    my $fields = join (",",@fields);
    my $add = "insert into $self->{TABLE} ($fields) values ("; 
    my (%record) = $record->tohash;
    for my $field (@fields) 
    { if (grep { $_ eq $field } @{$self->{NUMERIC}}) 
      { ($record{$field}) = $record{$field} =~ /(\d*)/; $add .= "$record{$field}, "; }
      if (grep { $_ eq $field } @{$self->{NON_NUMERIC}}) 
      { $add .= $self->{_HANDLER}->quote($record{$field}).", "; } 
    }
    chop $add; chop $add;
    $add .= " )";
    my $sth = $self->{_HANDLER}->prepare($add);
    $sth->execute();
    #Fix this!
    #Mysql uses select id from $self->{TABLE} where id = last_insert_id()
    #Postgres uses $sth->{pg_oid_status}
    if ($self->{_HANDLER}->{Driver}->{Name} eq "mysql")
    { $sth = $self->{_HANDLER}->prepare("select id from $self->{TABLE} where id = last_insert_id()"); 
      $sth->execute();
      ($id) = $sth->fetchrow_array();
    }
    if ($self->{_HANDLER}->{Driver}->{Name} eq "Pg")
    { $id = $sth->{pg_oid_status}; }
    $sth->finish;
  }
  return $id;
}

sub delete
{ my $self = shift;
  my $id = shift;
  if (ref $id eq "SPINE::Base::$self->{MODULE}") { $id = $id->id; } 
  if ($id) 
  { ($id) = $id =~ /(\d*)/;
    my $sth = $self->{_HANDLER}->prepare("delete from $self->{TABLE} where id = ?");
    $sth->execute($id);
    $sth->finish;
  }
}

sub fields
{ my $self = shift; return @{$self->{FIELDS}}; }

sub numeric
{ my $self = shift; return @{$self->{NUMERIC}}; }

sub non_numeric
{ my $self = shift; return @{$self->{NON_NUMERIC}}; }

1;
__END__

=pod

=head1 NAME

SPINE::DBI::Base

=head1 DESCRIPTION

This is the DBI base class for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 DEBUGGING

Set $SPINE::DBI::Base::DEBUGTABLE to the table you wish to monitor during get statements.

 $SPINE::DBI::Base::DEBUGTABLE = "message"; #To monitor get statements from the message table

=head1 VERSION

This is spine 1.1.

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
