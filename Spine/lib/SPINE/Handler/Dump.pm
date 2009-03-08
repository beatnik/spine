package SPINE::Handler::Dump;

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

use vars qw($VERSION);

use SPINE::Constant;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my $module = "";
  my $handler_db = "";
  eval qq{
    use SPINE::DBI::$module;
    my \$handler_db = SPINE::DBI::\$module->new(\$dbh);
  };
  my @list = ();
  @list = @{ $handler_db->get() };
  my $ref = process(\@list);
  return ${$ref} if ref($ref);
}

sub process
{ my $ref = shift(@_);
  return \$ref;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Dump

=head1 DESCRIPTION

This is the Dump plugin for SPINE. This plugin can be used manually but is primarily used by the command line tool.

Parameters

 * type
   - content
   - style
   - message
 
 * output
   - xml
   - sql
 
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
