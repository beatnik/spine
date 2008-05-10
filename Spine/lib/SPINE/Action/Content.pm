package SPINE::Action::Content;

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
use SPINE::DBI::Content;
use SPINE::Base::Content;

use Data::Dumper;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $dbh = shift; #Database Handler
  my $action = shift; #SPINE::Action::Content reference
  my $body = undef;
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  if ($action->action eq "create")
  { my %default = SPINE::Base::Content::default->tohash;
    my $content = SPINE::Base::Content->new( { %default, name => $action->dataname, $action->actionkey => $action->actionvalue } );
    my ($sec,$min,$hour,$day,$mon,$year) = localtime;
    $mon++; $year += 1900;
    $content->modified("$year-$mon-$day $hour:$min:$sec") if ref $content;
    $content->owner($action->owner);
    $content_dbi->add($content);
  }
  if ($action->action eq "update")
  { my $content = shift @{ $content_dbi->get( { name => $action->dataname } ); };
    my %hash = $content->tohash;
    $hash{$action->actionkey} = $action->actionvalue;
    $content = SPINE::Base::Content->new(\%hash);
    $content_dbi->update($content);
  }
  if ($action->action eq "copy")
  { my $content = shift @{ $content_dbi->get( { name => $action->dataname } ); };
    $content->name($action->actionvalue);
    $content->id(0);
    $content_dbi->add($content);
  }
  if ($action->action eq "remove")
  { my $content = shift @{ $content_dbi->get( { name => $action->dataname } ); };
    $content_dbi->remove($content);
  }
  if ($action->action eq "rename")
  { my $content = shift @{ $content_dbi->get( { name => $action->dataname } ); };
    $content->name($action->actionvalue);
    $content_dbi->update($content,1);
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Action::Content

=head1 DESCRIPTION

This is the Content Action handler for SPINE.

This handler handles all Content related actions

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
