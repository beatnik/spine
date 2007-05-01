package SPINE::Handler::Slides;

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

#Request Handler
#DB Handler

use SPINE::Base::Navbar;
use SPINE::DBI::Content;
use SPINE::DBI::Navbar;
use SPINE::DBI::Button;
use SPINE::DBI::Attribute;
use SPINE::Constant;

use strict;

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my ($params) = $tag =~ m/\(([^\)]*)\)/gmx;
  my @params = split(/,/,$params);
  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//gmx;	
  my $navbar_dbi = SPINE::DBI::Navbar->new($dbh);
  my $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  my $button_dbi = SPINE::DBI::Button->new($dbh);
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $name = shift @params;
  ($name) = $name =~ /\"?([^\"]*)\"?/mx;
  my $navbar = shift @{ $navbar_dbi->get({name=>$name, count=>1}) } ;

  my (@attributes) = shift @{ $attribute_dbi->get({section=>"navbar",name=>$name}) } ;
  my (@buttons) = @{ $button_dbi->get({navbar=>$navbar->id}) } ;
  my %navbarhash = $navbar->tohash; 
  my $body;
  my (%attributes) = ();
  for my $attr (@attributes) #Take Attributes for Navbar and dump in %attributes
  { next if !$attr;
    my $a = $attr->attr;
    $attributes{$a} = $attr->value;
  }
  if ($navbarhash{font} || $navbarhash{size} || $navbarhash{color})
  { $body .= qq(<font);
    if ($navbarhash{font})
    { $body .= qq( face="$navbarhash{font}"); }
    if ($navbarhash{size})
    { $body .= qq( size="$navbarhash{size}"); }
    if ($navbarhash{color})
    { $body .= qq( color="$navbarhash{color}"); }
    $body .= ">";
  }
  my $i = @buttons;  
  my $prev = undef;
  my $next = undef;
  my $i = undef;
  for (@buttons) 
  { if($_->link eq $url) 
    { if ($i != 0) { $prev = $buttons[$i-1]; }
	  if ($i != $#buttons) { $next = $buttons[$i+1]; }
	  last; 
	 } 
    $i++; 
  }
  my %prevhash = $prev->tohash if $prev;
  my %nexthash = $next->tohash if $next;
  $body .=  qq(<a href="$prevhash{link}">) if ($prev && defined $prevhash{link} && $prevhash{link} ne "");
  if ($prev && $prevhash{image})
  { $body .= qq(<img src="$prevhash{image}");
    $body .= qq( alt="$prevhash{label}") if (defined($prevhash{label}) && $prevhash{label} ne "");
    $body .= qq( border="$prevhash{border}") if (defined($prevhash{border}) && $prevhash{border} ne "");
    $body .= qq( width="$prevhash{width}") if (defined($prevhash{width}) && $prevhash{width} ne "");
    $body .= qq( height="$prevhash{height}") if (defined($prevhash{height}) && $prevhash{height} ne "");
    $body .= qq(>);     
  }

  if ($prev && !$prevhash{image} && $prevhash{label})
  { $body .= $navbarhash{style} =~ /bold/gmxi ? "<b>" : "";
    $body .= $navbarhash{style} =~ /italic/gmxi ? "<i>" : "";
    $body .= $navbarhash{style} =~ /underline/gmxi ? "<u>" : "";
  }

  $body .= $prevhash{label} if ($prev && !$prevhash{image} && $prevhash{label});
  $body .=  qq(</a>) if ($prev && defined($prevhash{link}));
  if ($prev && $navbarhash{style})
  { $body .= $navbarhash{style} =~ /bold/gmxi ? "</b>" : "";
    $body .= $navbarhash{style} =~ /italic/gmxi ? "</i>" : "";
    $body .= $navbarhash{style} =~ /underline/gmxi ? "</u>" : "";
  }
  $body .= "$navbarhash{sep}" if ($next && $prev);
  $body .=  qq(<a href="$nexthash{link}">) if ($next && defined $nexthash{link} && $nexthash{link} ne "");
  if ($next && $nexthash{image})
  { $body .= qq(<img src="$nexthash{image}");
    $body .= qq( alt="$nexthash{label}") if ($next && defined($nexthash{label}) && $nexthash{label} ne "");
    $body .= qq( border="$nexthash{border}") if ($next && defined($nexthash{border}) && $nexthash{border} ne "");
    $body .= qq( width="$nexthash{width}") if ($next && defined($nexthash{width}) && $nexthash{width} ne "");
    $body .= qq( height="$nexthash{height}") if ($next && defined($nexthash{height}) && $nexthash{height} ne "");
    $body .= qq(>);     
  }

  if ($next && !$nexthash{image} && $nexthash{label})
  { $body .= $navbarhash{style} =~ /bold/gmxi ? "<b>" : "";
    $body .= $navbarhash{style} =~ /italic/gmxi ? "<i>" : "";
    $body .= $navbarhash{style} =~ /underline/gmxi ? "<u>" : "";
  }

  $body .= $nexthash{label} if ($next && !$nexthash{image} && $nexthash{label});
  $body .=  qq(</a>) if ($next && defined($nexthash{link}));
  if ($next && $navbarhash{style})
  { $body .= $navbarhash{style} =~ /bold/gmxi ? "</b>" : "";
    $body .= $navbarhash{style} =~ /italic/gmxi ? "</i>" : "";
    $body .= $navbarhash{style} =~ /underline/gmxi ? "</u>" : "";
  }
  
  if ($navbarhash{font} || $navbarhash{size} || $navbarhash{color})
  { $body .= qq(</font>); }

 return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Navbar

=head1 DESCRIPTION

This is the Navbar Handler for SPINE.

=head1 SYNOPSIS

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
