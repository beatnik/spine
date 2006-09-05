package SPINE::Base::Content;

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
use warnings;
no warnings 'redefine';
use SPINE::Constant;

$VERSION = $SPINE::Constant::VERSION;

@NUMERIC = qw( id breaks logging );
@NON_NUMERIC = qw( name title style macros keywords body modified owner usergroup permissions icomment type);

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


# Content Methods

# Size
sub size 
{ my $self = shift;
 return length($self->{BODY});
}

sub tohash 
{ my $self = shift;
  my %hash = ();
  for(keys %{$self})
  { my $lc = lc $_; $hash{$lc} = $self->{$_}; }
  return (%hash);
}

sub default 
{ my ($sec,$min,$hour,$day,$mon,$year) = localtime;
  $mon++; $year += 1900;
  return SPINE::Base::Content->new(
        {id=>0,
         owner=>'admin', 
         body=>"Stub content...<br><br> It looks like the author was negligent enough to leave this stub.", 
         permissions=>'1010',
         breaks=>0,
         logging=>1,         
         icomment=>'This is where you put comments about this content',
         title=>'STUB Content',
         style=>'main',
         usergroup=>'users',
         modified => "$year-$mon-$day $hour:$min:$sec"
         });
}

sub AUTOLOAD {
 my $self = shift;
 my $method = $AUTOLOAD;
 $method =~ s/.*:://mx;
 return if $method eq "DESTROY";
 warn "Invalid method: $method" unless $fields{$method};
 $self->{uc $method} = shift if @_;
 return $self->{uc $method};
}

1;
__END__

=pod

=head1 NAME

SPINE::Base::Content

=head1 DESCRIPTION

This is the Content base class for spine.

SPINE uses abstract classes to pass data from and to the database module and the handler. 

=head1 SYNOPSIS

 use SPINE::DBI::Content;

 my $content_dbi = SPINE::DBI::Content->new($dbh); #Database handler
 my $content = shift @{$content_dbi->get({name=>"index.html"})}; 
 if (!ref $content) { $content = SPINE::Base::Content::default(); 

 #Print the body
 print $content->body;

 #Dump the content to a hash
 my %hash = $content->tohash;

=head1 SYNTAX

All these attributes are object based getter/setter functions.

 $content->id

This attribute is only used for Database purposes.

 $content->breaks

This boolean attribute sets weither or not to convert newlines to HTML breaks.

 $content->logging

This boolean attribute sets weither or not to log access to the page.

 $content->name

This attribute sets the filename of this page. For example 'index.html'.

 $content->title

This attribute sets the title of this page.

 $content->macros

This attribute defines which macros to use. It is linked to the Macro section and is currently not used.

 $content->keywords

This attribute defines which keywords are used. These keywords are used in the search function (that still needs to be implemented).

 $content->body

This attribute defines the actual page content.

 $content->modified

This attribute will contain the last modification date of this page.

 $content->owner

This attribute will contain the owner name of the page. This is used for the access permissions.

 $content->usergroup

This attribute will contain the usergroup. This is used for the access permissions.

 $content->permissions

This attribute contains the bitmasks of the permissions for both the usergroup and the world. This bit similar to the UNIX style permissions, except that the owner permissions are set to all access.

 $content->icomment

This attribute allows you to add internal comments to the page. This comment is never specifically shown and is purely for easier administration.

 $content->type

This attribute allows you to define a content type for this page. For instamce, when your content is XML, set this to text/xml.

 $content->size

This attribute returns the size of the page.

 $content->default

This method returns the default values for the page. This can be used to capture any invalid instances.

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
