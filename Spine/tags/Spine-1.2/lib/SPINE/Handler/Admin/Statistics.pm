package SPINE::Handler::Admin::Statistics;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.31 $

use SPINE::DBI::Statistics;
use SPINE::DBI::Content;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Session;
use SPINE::DBI::Attribute;

use SPINE::Constant;

use strict;

use SPINE::Transparent::Request;
use SPINE::Transparent::Constant;

#Apache::Request Handler
#DB Handler

use vars qw($VERSION $content_dbi $stats_dbi $request $user_dbi $usergroup_dbi $adminaccess_dbi $attribute_dbi $session_dbi $request $readperms $writeperms $execperms $user $adminaccess $error %i18n %default);
use vars qw($valid_perms_string $view_stats_string $remove_stats_string);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  %default = ();
  %i18n = ();
  my $url = $request->uri;
  my $location = $request->location;

  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;
    
  $url =~ s/^$location\/?//mx;

  ($url,@params) = split("/",$url);

  $content_dbi = SPINE::DBI::Content->new($dbh);
  $stats_dbi = SPINE::DBI::Statistics->new($dbh);
  $user_dbi = SPINE::DBI::User->new($dbh);
  $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  $session_dbi = SPINE::DBI::Session->new($dbh);  
  $url = '.admin-stats-general'; 

  my $session = undef;
  $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
  $user = "admin";
  $user = $session->username if $session;

  my (@default_hash) = @{$attribute_dbi->get(section=>"default",attr=>$user)};
  for(@default_hash)
  { my %hash = ();
    if ($_) { %hash = %{$_}; }
    $default{$hash{'NAME'}} = $hash{'VALUE'};
 }

  my $lang = $default{'lang'} || "";
  $lang = ".$lang" if $lang;
  $lang = "" if $lang eq ".en";

  my (@i18n_hash) = @{$attribute_dbi->get(section=>"i18n",attr=>$lang)};
  for(@i18n_hash)
  { my %hash = undef;
    if ($_) { %hash = %{$_}; }
    $i18n{$hash{'NAME'}} = $hash{'VALUE'};
  }
  
  $valid_perms_string = $i18n{'valid_perms'} || "You do not have valid permissions for this operation : ";
  $view_stats_string = $i18n{'view_stats'} || " View statistics<br>";
  $remove_stats_string = $i18n{'remove_stats'} || "Remove statistics<br>";

  my @usergroups =  @{ $usergroup_dbi->get({username=>$user}) };
  @usergroups = map { $_ = $_->usergroup } @usergroups;
  my @adminaccess = ();
  for(@usergroups)
  { push(@adminaccess, @{ $adminaccess_dbi->get({usergroup=>$_, section=>'stats'}) }); }
  my %permissions = ();
  for(@adminaccess) { $adminaccess = $adminaccess | $_->permissions; }

  $readperms = $adminaccess & READACCESS;
  $readperms =~ s/0//gmx;
  $writeperms = $adminaccess & WRITEACCESS;
  $writeperms =~ s/0//gmx;
  $execperms = $adminaccess & EXECACCESS;
  $execperms =~ s/0//gmx;

  shift @params;

  if (!$params[0])
  { $url = '.admin-stats-general'; @params = (); }

  if ($params[0] eq 'view' && !$readperms)
  { $error = $valid_perms_string.$view_stats_string;
    $url = '.admin-stats-general'; 
  }

  if ($params[0] eq 'remove' && !$execperms)
  { $error = $valid_perms_string.$remove_stats_string;
    $url = '.admin-stats-general'; 
  }

  if ($params[0] eq 'view' && !$error)
  { $url = '.admin-stats'; }
  
  if ($params[0] eq 'remove' && !$error && $request->method eq "POST")
  { $url = '.admin-stats-general'; 
    remove($request);
  }

  my $content = shift @{$content_dbi->get({name=>$url, count=>1})};
  if (!ref $content)
  { return $SPINE::Transparent::Constant::NOT_FOUND; }
  my $body = undef;
  $body = $content->body if ref $content;
  if ($url eq ".admin-general")
  { $content->title("Statistics Administration"); }

  if ($params[0] eq 'view')
  { my $name = $request->param('name');
    for my $stat (qw(referer useragent remoteaddr query))
    { my $list = undef;
      for(@{$stats_dbi->get($stat,$name)})
      { my %hash = %{$_};
        my $number = $hash{number};
        $list .= qq(<tr><td>$hash{$stat}</td><td><img src="/images/dot.jpg" width="$number" height="10">&nbsp;$hash{number}</td></tr>\n);
      }
      $body =~ s/\$${stat}list/$list/gxm;
      $body =~ s/\$name/$name/gmx;
    }
  } 

  if ($params[0] eq 'remove' || !$params[0]) 
  { my @list = @{$stats_dbi->getlist()};
    #Only show hidden files in the listing if you are admin
    #Comment these 2 lines if you wish to include the dot-files in the listing..
    if ($user ne 'admin')
    { @list = grep { $_ =~ /^[^\.]/mx } @list; }

    my $list = undef;
    for(@list) { $list .= "<option value=\"$_\">$_\n"; }
    my $namelist = undef;
    my (@counter) = @{ $attribute_dbi->get({section=>"stats",name=>"counter", order=>"attr"}) } ; 
    my (%counters) = ();
    for my $attr (@counter) #Take Attributes for Navbar and dump in %attributes
    { next if !$attr;
      my $a = $attr->attr;
      if ($user ne 'admin')
      { $counters{$a} = $attr->value if $a =~ /^[^\.]/mx; }
      else { $counters{$a} = $attr->value; }
    }
    #@list = @{$stats_dbi->get("name")};
    #Only show hidden files in the listing if you are admin
    #Comment these 2 lines if you wish to include the dot-files in the listing..

    for my $name (sort keys %counters)
    { $namelist .= qq(<tr><td>$name</td><td><img src="/images/dot.jpg" width="$counters{$name}" height="10">&nbsp;$counters{$name}</td></tr>\n);
    }

    $body =~ s/\$list/$list/gmx;
    $body =~ s/\$namelist/$namelist/gmx;
    $body =~ s/\$type/statistics/gmx;
    $body =~ s/\$label/statistics/gmx;
  }
   
  $content->body($body);
  return $content;
}

sub remove 
{ my $stats = shift @{$stats_dbi->get(name=>scalar($request->param('name')))};
  $stats_dbi->remove($stats);
  my $counter = shift @{$attribute_dbi->get(section=>"stats",name=>"counter",attr=>scalar($request->param('name')))};
  $attribute_dbi->remove($counter);
  return;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Statistics

=head1 DESCRIPTION

This is the Apache Content Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.2.

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
