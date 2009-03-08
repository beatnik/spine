package SPINE::Handler::DumpSQL;

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

#Apache::Request Handler
#DB Handler

use strict;

use SPINE::Constant;
use vars qw($VERSION);
use base qw(SPINE::Handler::Dump);

$VERSION = $SPINE::Constant::VERSION;

sub process
{ my $ref = shift(@_);
  my $type = shift(@_);
  my $body .= "\n\n--\n-- mysql v3 dump for SPINE 1.1 : Table $type\n--\n\n";
  for(@{$ref})
  { my %hash = $_->tohash;
    $body .= "insert into $type (";
    my @keys = sort keys %hash;
    while ($_ = shift(@keys))
    { $body .= $_;
      $body .= "," if @keys;
    }
    $body .= ") values (";
    @keys = sort keys %hash;
    while($_ = shift(@keys))
    { my $f = $hash{$_};
      $f =~ s/\"/\\\"/gmx;
      $f =~ s/\'/\\\'/gmx;
      $f =~ s/\n/\\n/gmx;
      $f =~ s/\r/\\r/gmx;
      $f =~ s/</\&lt;/gmx;
      $f =~ s/>/\&gt;/gmx;
      $body .= qq('$f');
      $body .= "," if @keys;
    }
    $body .= ");\n";
  }
  return \$body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::DumpSQL

=head1 DESCRIPTION

This is the DumpSQL plugin for SPINE. This plugin can be used manually but is primarily used by the command line tool.
 
=head1 SYNOPSIS

 <?SPINE_Dump?>

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
