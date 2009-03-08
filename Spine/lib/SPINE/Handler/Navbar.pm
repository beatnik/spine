package SPINE::Handler::Navbar;

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
{ my $r = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my ($params) = $tag =~ m/\(([^\)]*)\)/gmx;
  my @params = split(/,/,$params);
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
  $body .= qq(<div align="$navbarhash{alignment}">\n) unless $navbar->alignment eq "none";  
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
  for (@buttons) 
  { my %buttonhash = $_->tohash; 
    $body .= qq(<li>) if $attributes{"li"};
    $body .=  qq(<a href="$buttonhash{link}">) if (defined $buttonhash{link} && $buttonhash{link} ne "");
    if ($buttonhash{image})
    { $body .= qq(<img src="$buttonhash{image}");
      $body .= qq( alt="$buttonhash{label}") if (defined($buttonhash{label}) && $buttonhash{label} ne "");
      $body .= qq( border="$buttonhash{border}") if (defined($buttonhash{border}) && $buttonhash{border} ne "");
      $body .= qq( width="$buttonhash{width}") if (defined($buttonhash{width}) && $buttonhash{width} ne "");
      $body .= qq( height="$buttonhash{height}") if (defined($buttonhash{height}) && $buttonhash{height} ne "");
      $body .= qq(>);     
    }

    if (!$buttonhash{image} && $buttonhash{label})
    { $body .= $navbarhash{style} =~ /bold/gmxi ? "<b>" : "";
      $body .= $navbarhash{style} =~ /italic/gmxi ? "<i>" : "";
      $body .= $navbarhash{style} =~ /underline/gmxi ? "<u>" : "";
    }

    $body .= $buttonhash{label} if (!$buttonhash{image} && $buttonhash{label});
    $body .=  qq(</a>) if defined($buttonhash{link});
    $body .= "<br>" if lc($navbarhash{positioning}) eq "vertical";
    $i--;
    $body .= "$navbarhash{sep}" if $i;
    if ($navbarhash{style})
    { $body .= $navbarhash{style} =~ /bold/gmxi ? "</b>" : "";
      $body .= $navbarhash{style} =~ /italic/gmxi ? "</i>" : "";
      $body .= $navbarhash{style} =~ /underline/gmxi ? "</u>" : "";
    }
    $body .= qq(</li>) if $attributes{"li"};
  }

  if ($navbarhash{font} || $navbarhash{size} || $navbarhash{color})
  { $body .= qq(</font>); }

 $body .= qq(</div>) unless $navbarhash{alignment} eq "none";
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
