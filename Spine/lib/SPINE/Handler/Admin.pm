package SPINE::Handler::Admin;

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

use warnings;

use SPINE::DBI::Content;
use SPINE::DBI::User;
use SPINE::DBI::Session;
use Data::Dumper;

use SPINE::Constant;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

use strict;
use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  my $main = $request->dir_config("main") || "index.html";

  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;

  my $url = $request->uri;
  my $location = $request->location;
  $url =~ s/^$location\/?//;
  ($url,@params) = split("/",$url);
  if (!$url)
  { $url = $main; }

  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $user_dbi = SPINE::DBI::User->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);

  my $content = undef;

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $user = undef;
  $user = shift @{$user_dbi->get({login=>$session->username, count=>1})} if $session;

  unless($session && $user && $session->username eq $user->login && $session->host eq $th_req->remote_host)
  { $content = shift @{$content_dbi->get({name=>$main, count=>1})};
    if (!ref $content)
    { $content = SPINE::Base::Content::default(); }
    return ($content,$SPINE::Transparent::Constant::FORBIDDEN);
  }

  $params[0] ||= 'content';

  if ($url eq 'admin' && $params[0])
  { my $module = ucfirst $params[0];
    my $value;
    my $status;
    $module =~ s/^(\w*).*/$1/g; #Just make sure it's all aboot letters..
    eval qq{
      use SPINE::Handler::Admin::$module;
      (\$value,\$status) = SPINE::Handler::Admin::${module}::handler(\$request,\$dbh);  #Call the handler method in that uhm handler
    };
    if ($@)
    { $status = $SPINE::Transparent::Constant::OK;
      my $c = SPINE::Base::Content->new({body=>"Something went wrong while loading $params[0]! Please contact your server administrator if the problem persists."});
      warn $@;
      return ($c,$status);
    }
    $status ||= $SPINE::Transparent::Constant::OK;
    return ($value,$status);
  }
}
1;
__END__

=pod

=head1 NAME

SPINE::Hander::Admin

=head1 DESCRIPTION

This is the Administration handler Handler for SPINE.

This module will call all other administration handlers if needed. 

=head1 SYNOPSIS

The first parameter to the URL is the handler which is called. For instance

 http://127.0.0.1/site/admin/content/

This call call SPINE::Handler::Admin::Content::handler and pass a reference to the Apache::Request and to a DBI handle.
We assume the module will return all the valid data so we print it.

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
