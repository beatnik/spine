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
    $id ||= $params{'id'};
  }
  if($id) 
  { ($id) = $id =~ /(\d*)/;
    my $statement = "select * from $self->{TABLE} where id = ?";
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

=head1 DEBUGGING

Set $SPINE::DBI::Base::DEBUGTABLE to the table you wish to monitor during get statements.

 $SPINE::DBI::Base::DEBUGTABLE = "message"; #To monitor get statements from the message table

=head1 How this works

This is the DBI base class. Most of the SPINE::DBI classes inherit from this module. The constructor method in each module redefines the object values needed for each object. 
The SPINE::DBI::Base class is never loaded directly but is only used for inheritance.

=head1 Object Attributes

  $self->{TABLE} = "attribute";
  $self->{MODULE} = "Attribute";
  $self->{GROUP} = "name";
  $self->{ORDER} = "name";
  $self->{NUMERIC} = [@SPINE::Base::Attribute::NUMERIC];
  $self->{NON_NUMERIC} = [@SPINE::Base::Attribute::NON_NUMERIC];
  $self->{FIELDS} = [qw(id section name attr value)];

=over 4

=item _HANDLER

The C<_HANDLER> attribute is considered for internal use and contains the Database handler as passed on constructor.

=item TABLE

The C<TABLE> attribute defines the table name in the database. This can be practically anything but common practice is to use the all lowercase version of the module. This attribute is a scalar.

=item MODULE

The C<MODULE> attribute defines the SPINE::Base::* module name. This can be practically anything but common practice is to use the same name as the table name, with the first letter in capital. This attribute is a scalar.

=item GROUP

The C<GROUP> attribute defines the SQL 'group by' variable. This attribute is a scalar.

=item ORDER

The C<ORDER> attribute defines the SQL 'order by' variable.  This attribute is a scalar.

=item NUMERIC

The C<NUMERIC> attributes contains the class fields that are considered numeric. This value is only important for the database. This attribute is an array reference. 

=item NON_NUMERIC

The C<NON_NUMERIC> attributes contains the class fields that are considered non-numeric. This value is only important for the database.  This attribute is an array reference.

=item FIELDS

The C<FIELDS> attributes contains all the class fields. This value is only important for the database.  This attribute is an array reference.

=back

=head1 Methods

=over 4

=item new

This constructor method does nothing more than set the class attributes and return the object. As parameter, it takes the database handler as passed by the Handler.

  my $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

=item get

The C<get> method can take a number parameters. The C<get> method will commonly return an array reference of objects. The only exception is when passing a record ID. In that case, C<get> returns a single object scalar.

=over 8

=item By record ID

Pass the element ID as a parameter.

  my $attribute = $attribute_dbi->get( 5 );

  my $attribute = $attribute_dbi->get( "id" => 5 );

  my $attribute = $attribute_dbi->get( { "id" => 5 } );

  my $attribute = $attribute_dbi->get( [ "id", 5 ] );

C<get> returns a scalar here.

=item Field names

Pass any field you wish to look for as a parameter. These values are checked with the field list defined in the module constructor. When passing record fields, C<get> returns an array reference.

  my $attributes_ref = $attribute_dbi->get( "name" => "foo" );

  my $attributes_ref = $attribute_dbi->get( [ "name" => "foo", "section" => "stats" ] );

  my $attributes_ref = $attribute_dbi->get( { "name" => "foo", "section" => "stats" } );

=item Search Type

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "searchtype" => "or", "section" => "foo" );

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "searchtype" => "and", "section" => "foo" );

  # Synonym

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "section" => "foo" );

This parameter works in combination with the object attributes. This will return all records where name is either "foo" or "bar". Other option here is 'and'. The default search type is 'and'.

=item Sorting

 my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "sort" => "section" );

The default sorting attribute is defined in the class constructor attribute "ORDER".

=item Limiting results

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "count" => 10 );

This will return the first 10 elements

=item Limiting result scope

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "limit" => 10, "offset" => 0 );

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "limit" => 10 );  

This will return the first 10 elements

  my $attributes_ref = $attribute_dbi->get( "name"=>"foo", "limit" => 10, "offset" => 10 );

This will return elements 10 to 19.

=item Get everything

  my $attributes_ref = $attribute_dbi->get();

  my $attributes_ref = $attribute_dbi->get( { "limit" => 10, "sort" => "name" } );

=back

=back

=over 4

=item getlist

C<getlist> always returns an array reference with B<strings>.

=over 8

=item Defining the field

Pass the fieldname in a parameter called C<field>. All regular parameters from C<get> apply.

  my $content_list = $content_dbi->getlist( { "field" => "name"} );

  my $content_list = $content_dbi->getlist( { "field" => "name", "style" => "main" } );

  my $content_list = $content_dbi->getlist( { "field" => "name", "sort" => "style" } );

  my $content_list = $content_dbi->getlist( { "field" => "name", "style" => "main", "searchtype" => "or", "style" => "main2"} );

  my $content_list = $content_dbi->getlist( { "field" => "name", "style" => "main", "count" => 10 } );

  my $content_list = $content_dbi->getlist( { "field" => "name", "style" => "main", "limit" => 10 } );

  my $content_list = $content_dbi->getlist( { "field" => "name", "style" => "main", "offset" => "4", "limit" => 10 } );  

=back

=back

=over 4

=item update

The C<update> method is used to update a certain object in the database. The method takes only parameter and has no return value. The ID field of a record is never updated. 

  my $content = $content_dbi->get( 5 ); #Get content with ID = 5

  $content->title( "Foo" );

  $content_dbi->update( $content );

=item add

The C<add> method is used to add a new record to the database. Add returns the ID of the newly created object. The example below makes a copy of an existing object.

  my $content = $content_dbi->get( 5 ); #Get content with ID = 5

  $content->name( "index.new.html" );

  my $new_id = $content_dbi->add( $content );

Create one inplace:

  my $new_id = $content_dbi->add( SPINE::Base::Content->new( { "name" => "foo" } ) );

=item delete

The C<delete> method is used to delete an existing record from the database.

  $content_dbi->delete( 5 ); # Delete record with ID 5

  my $content = $content_dbi->get( 5 ); #Get content with ID = 5

  $content_dbi->delete( $content ); # Retrieve record ID from object and delete it

=item fields

The C<fields> method returns the fields as defined in the constructor method. See L<FIELDS>.

=item numeric

The C<numeric> method returns the numeric fields as defined in the constructor method. See L<NUMERIC>.

=item non_numeric

The C<non_numeric> method returns the non-numeric fields as defined in the constructor method. See L<NON_NUMERIC>.

=back

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
