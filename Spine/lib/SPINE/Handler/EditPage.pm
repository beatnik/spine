package SPINE::Handler::EditPage;

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
use SPINE::DBI::Session;
use SPINE::Transparent::Request;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my $body = undef;
  my $readonly = undef;
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//gmx;
  my %cookies = $request->cookies;
  my $session_dbi = SPINE::DBI::Session->new($dbh);
  my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $user = "admin";
  $user = $session->username if $session;
  my $edit_content = shift @{$content_dbi->get({name=>$url}, count=>1)};
  if ($user ne 'admin' && $edit_content->owner ne $user && $edit_content->permissions !~ /^\d1/mx && $edit_content->permissions !~ /\d1$/mx)
  { $readonly = 1; }
  if (!$readonly)
  { $body = qq(<form name="adminform" method="post" action="<?SPINE_Location?>/admin/content/edit/"><input type="hidden" name="name" value="$url"></form><a href="javascript: document.adminform.submit();">Edit Page</a>);   }
  return $body;
 }

1;
__END__

=pod

=head1 NAME

SPINE::Handler::EditPage

=head1 DESCRIPTION

This is the EditPage Plugin for SPINE.

This handler will dump all the Environment variables and is purely for demonstrational purposes.

=head1 SYNOPSIS

 <?SPINE_EditPage?>

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
