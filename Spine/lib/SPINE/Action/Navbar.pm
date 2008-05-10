package SPINE::Action::Navbar;

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
use SPINE::Base::Navbar;
use SPINE::Base::Button;
use SPINE::DBI::Navbar;
use SPINE::DBI::Button;

use Data::Dumper;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $dbh = shift; #DB Handler
  my $action = shift; #SPINE::Action::Navbar reference
  my $body = undef;
  my $navbar_dbi = SPINE::DBI::Navbar->new($dbh);
  my $button_dbi = SPINE::DBI::Button->new($dbh);
  
  if ($action->action eq "create")
  { my %default = SPINE::Base::Navbar::default->tohash;
    my $navbar = SPINE::Base::Navbar->new( { %default, name => $action->dataname, $action->actionkey => $action->actionvalue } );
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $navbar->modified("$year-$mon-$day $hour:$min:$sec") if ref $navbar;
    $navbar->owner($action->owner);
    $navbar_dbi->add($navbar);
  }
  if ($action->action eq "addbutton")
  { my %default = SPINE::Base::Button::default->tohash;
    my $button = SPINE::Base::Button->new( { %default, navbar => $action->dataname, $action->actionkey => $action->actionvalue } );
    $button_dbi->add($button);
  }
  if ($action->action eq "update")
  { my $navbar = shift @{ $navbar_dbi->get( { name => $action->dataname } ); };
    my %hash = $navbar->tohash;
    $hash{$action->actionkey} = $action->actionvalue;
    $navbar = SPINE::Base::Navbar->new(\%hash);
    $navbar_dbi->update($navbar);
  }
  if ($action->action eq "updatebutton")
  { my %default = SPINE::Base::Button::default->tohash;
    my $button = SPINE::Base::Button->new( { %default, navbar => $action->dataname, $action->actionkey => $action->actionvalue } );
    my %hash = $button->tohash;
    $hash{$action->actionkey} = $action->actionvalue;
    $button = SPINE::Base::Button->new(\%hash);
    $button_dbi->update($button);
  }
  if ($action->action eq "copy")
  { my $navbar = shift @{ $navbar_dbi->get( { name => $action->dataname } ); };
    $navbar->name($action->actionvalue);
    $navbar->id(0);
    $navbar_dbi->add($navbar);
  }
  if ($action->action eq "remove")
  { my $navbar = shift @{ $navbar_dbi->get( { name => $action->dataname } ); };
    $navbar_dbi->remove($navbar);
  }
  if ($action->action eq "removebutton")
  { my $button = shift @{ $button_dbi->get( { id => $action->dataname } ); };
    $button_dbi->remove($button);
  }
  if ($action->action eq "rename")
  { my $navbar = shift @{ $navbar_dbi->get( { name => $action->dataname } ); };
    $navbar->name($action->actionvalue);
    $navbar_dbi->update($navbar,1);
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Action::Navbar

=head1 DESCRIPTION

This is the Navbar Action handler for SPINE.

This handler handles all navbar related actions

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
