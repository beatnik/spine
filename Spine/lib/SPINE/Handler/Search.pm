package SPINE::Handler::Search;

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

use warnings;
use strict;
use vars qw($VERSION);
use Data::Dumper;

use SPINE::Constant;
use SPINE::DBI::Content;
use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::Base::Content;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

$VERSION = $SPINE::Constant::VERSION;

sub handler
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift; #
  my ($params) = $tag =~ m/\(([^\)]*)\)/gmx;
  my @params = split(/,/,$params);
  my $body = undef;

  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;

  my $keyword = $request->param("keyword");
  return "Please define a search keyword" if !$keyword;
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);  
  my $user_dbi = SPINE::DBI::User->new($dbh);  
  my $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);  
  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  my $loadpage = 0;

  for my $content (@{$content_dbi->get("sort"=>"name")})
  { my $keywords = $content->keywords;
    
    my $content_owner = shift @{$user_dbi->get({login=>$content->owner, count=>1})};
    
    my $loadpage = 0;
    my $readwperms = $content->permissions & READWPERMISSIONS;
    $readwperms =~ s/0//gmx;
    $loadpage = $readwperms; 
    
    if ($session && $content_owner && $session->username eq $content_owner->login && $session->host eq $request->get_remote_host && !$loadpage)
    { my @usergroups =  @{ $usergroup_dbi->get({username=>$session->username}) };
      @usergroups = map { $_ = $_->usergroup } @usergroups;
      my $readgperms = $content->permissions & READGPERMISSIONS;
      $readgperms =~ s/0//gmx;
      $loadpage = 
      ($session->username eq 'admin') ||
      ($content->owner eq $session->username) ||
      (@usergroups && $readgperms);
    }
    $loadpage = 0 if $content->name =~ /^admin/mx;
    next if !$loadpage;
    next if $content->name =~ /^\./mx;
    if ($keywords =~ /$keyword/mx)
    { my $name = $content->name;
      $body .= qq(<a href="$name">$name</a><br>\n); }
  }
  return "No results" if !$body;
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Search

=head1 DESCRIPTION

This is the Search engine SPINE plugin.

=head1 SYNOPSIS

 <?SPINE_Search?>

This plugin returns a list of pages that match search criteria.

Create a page with search results (e.g search.html):

<h1>Search Results</h1>
<?SPINE_Search?>

Define a form:

<form action="search.html" method="get">
Search: <input type="text" name="keyword">&nbsp;<input type="submit" value="Search">
</form>
 
Set a text input field with name "keyword".

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
