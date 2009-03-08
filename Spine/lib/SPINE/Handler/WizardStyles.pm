package SPINE::Handler::WizardStyles;

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
use SPINE::DBI::Content;
use SPINE::DBI::Style;
use SPINE::DBI::Session;
use SPINE::DBI::Usergroup;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my $body = "";
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $style_dbi = SPINE::DBI::Style->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);	
  my $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);	
  my $url = $request->uri;
  my $location = $request->location;
  my %cookies = $request->cookies;
  $url =~ s/^$location\/?//gmx;
  my @li = @{$style_dbi->get()};
  my @list = ();
  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $user = "admin";
  $user = $session->username if $session;
  my @usergroups =  @{ $usergroup_dbi->get({username=>$user, count=>1}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;  
  my $images = $request->dir_config("images") || "/images/";

  for my $c (@li)
  { my $readgperms = $c->permissions & READGPERMISSIONS;
    $readgperms =~ s/0//gmx;
    my $readwperms = $c->permissions & READWPERMISSIONS;
    $readwperms =~ s/0//gmx;
	if ($c->name =~ /^\./) { next; }
    my @groups = grep { $_ eq $c->usergroup } @usergroups;
    if ( ($user eq 'admin' || #User is admin
          $c->owner eq $user || #User is owner of content
          $readwperms) || #Style is world readable
          (@groups && $readgperms) #Style is group readable and user is part of group
       )
     { push(@list,$c->name); next; }
  }  

  for my $style (@list)
  { $body .= <<STYLE;
	  <div class="thumbnail">
<img src="$images${style}_thumb.jpg" alt="" width="91" height="105"><br>
<input type="radio" name="style" value="$style"> $style</div>
STYLE
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::WizardStyles

=head1 DESCRIPTION

This is the WizardStyles Plugin for SPINE.

This plugin generates the HTML needed in the Content wizard.

=head1 SYNOPSIS

 <?SPINE_WizardStyles?>

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
