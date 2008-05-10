package SPINE::Action::Style;

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

#DB Handler

use strict;

use vars qw($VERSION);

use SPINE::Constant;
use SPINE::DBI::Style;
use SPINE::Base::Style;

use Data::Dumper;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $dbh = shift; #DB Handler
  my $action = shift; #SPINE::Action::Navbar reference
  my $body = undef;
  my $style_dbi = SPINE::DBI::Style->new($dbh);
  if ($action->action eq "create")
  { my %default = SPINE::Base::Style::default->tohash;
    my $style = SPINE::Base::Style->new( { %default, name => $action->dataname, $action->actionkey => $action->actionvalue } );
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $style->modified("$year-$mon-$day $hour:$min:$sec") if ref $style;
    $style->owner($action->owner);
    $style_dbi->add($style);
  }
  if ($action->action eq "update")
  { my $style = shift @{ $style_dbi->get( { name => $action->dataname } ); };
    my %hash = $style->tohash;
    $hash{$action->actionkey} = $action->actionvalue;
    $style = SPINE::Base::Style->new(\%hash);
    $style_dbi->update($style);
  }
  if ($action->action eq "copy")
  { my $style = shift @{ $style_dbi->get( { name => $action->dataname } ); };
    $style->name($action->actionvalue);
    $style->id(0);
    $style_dbi->add($style);
  }
  if ($action->action eq "remove")
  { my $style = shift @{ $style_dbi->get( { name => $action->dataname } ); };
    $style_dbi->remove($style);
  }
  if ($action->action eq "rename")
  { my $style = shift @{ $style_dbi->get( { name => $action->dataname } ); };
    $style->name($action->actionvalue);
    $style_dbi->update($style,1);
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Action::Style

=head1 DESCRIPTION

This is the Style Action handler for SPINE.

This handler handles all style related actions

=head1 VERSION

This is spine 1.3 beta.

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
