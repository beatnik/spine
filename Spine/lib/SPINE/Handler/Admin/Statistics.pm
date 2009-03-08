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
use Data::Dumper;

use strict;

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

  SPINE::Transparent::Constant->new($request);
  my %cookies = $request->cookies;
    
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
  $view_stats_string = $i18n{'view_stats'} || " View statistics";
  $remove_stats_string = $i18n{'remove_stats'} || "Remove statistics";

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
  if ($url eq ".administration/general")
  { $content->title("Statistics Administration"); }

  if ($params[0] eq 'view')
  { my $name = $request->param('name');
    for my $stat (qw(referer useragent remoteaddr query))
    { my $list = undef;
      my $ctotal = 0;
      my @statlist = @{$stats_dbi->get($stat,$name)};
      for (@statlist)
      { $ctotal += $_->{number};
        $_->{$stat} ||= "-";
      }
      for (@statlist)
      { my %hash = %{$_};
        my $percentage = sprintf("%.2f",( ( $hash{number} / $ctotal ) * 100 ) );
        $list .= qq(<div name="adminpanel" class="fullpanel"><div class="panelcel" style="width: 45%; height: auto">$hash{$stat}</div>\n);
        $list .= qq(<div class="panelcel" style="width: auto"><img src="/images/dot.jpg" style="border: 1px solid #888888" width="$percentage" height="10">&nbsp;$hash{number} ($percentage%)</div><div class="spacercel"></div></div>\n);
      }
      $body =~ s/\$${stat}list/$list/gxm;
      $body =~ s/\$name/$name/gmx;
    }
    for my $stat ("monthname(sdate)", "dayname(date(sdate))", "hour(sdate)")
    { my @statlist = @{$stats_dbi->get([$stat, "name"],$name)};
      my $datelist = undef;
      my $ctotal = 0;
      for (@statlist)
      { $ctotal += $_->{number}; }      
      for my $lstat (@statlist)
      { my %hash = %{$lstat};
        my $percentage = sprintf("%.2f",( ( $hash{number} / $ctotal ) * 100 ) );
        $datelist .= qq(<div name="adminpanel" class="fullpanel"><div class="panelcel" style="width: 45%; height: auto">$hash{"$stat"}</div><div class="panelcel" style="width: 45%; height: auto"><img src="/images/dot.jpg" style="border: 1px solid #888888" width="$percentage" height="10">&nbsp;$hash{number} ($percentage%)</div><div class="spacercel"></div></div>\n);
      }
      my $label = "";
      $label = $stat eq "monthname(sdate)" ? "month" : "";
      $label = $stat eq "dayname(date(sdate))" ? "weekday" : $label;
      $label = $stat eq "hour(sdate)" ? "hour" : $label;
      $body =~ s/\$${label}list/$datelist/gxm;
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
    my $total = 0;
    for my $attr (@counter) #Take Attributes for Navbar and dump in %attributes
    { next if !$attr;
      my $a = $attr->attr;
      if ($user ne 'admin')
      { $counters{$a} = $attr->value if $a =~ /^[^\.]/mx; }
      else { $counters{$a} = $attr->value; }
      $total += $counters{$a};
    }
    #@list = @{$stats_dbi->get("name")};
    #Only show hidden files in the listing if you are admin
    #Comment these 2 lines if you wish to include the dot-files in the listing..
    my $orderf = "";
    my $orderc = "";
    my $sort = $request->param("sort") || "filename";
    my @sorted = ();
    if ($sort eq "filename")
    { @sorted = sort keys %counters; $orderf = "r"; }

    if ($sort eq "filenamer")
    { @sorted = sort keys %counters; @sorted = reverse(@sorted); $orderf = ""; }
    
    if ($sort eq "counter")
    { @sorted = sort { $counters{$a} <=> $counters{$b} } keys %counters;
      $orderc = "r"; 
    }

    if ($sort eq "counterr")
    { @sorted = sort { $counters{$b} <=> $counters{$a} } keys %counters;
      $orderc = ""; 
    }

    for my $name (@sorted)
    { $namelist .= qq(<div name="adminpanel" class="fullpanel"><div class="panelcel" style="width: 20%">$name</div>\n);
      my $percentage = sprintf("%.2f",( ( $counters{$name} / $total ) * 100 ) );
      $namelist .= qq(<div class="panelcel" style="width: auto"><img src="/images/dot.jpg" style="border: 1px solid #888888" width="$percentage" height="10">&nbsp;$counters{$name} ($percentage%)</div><div class="spacercel"></div></div>\n);
    }
    if ($error) { $error = qq(<p class="error">$error</p>); }
    $body =~ s/\$error/$error/gmx;
    $body =~ s/\$list/$list/gmx;
    $body =~ s/\$orderf/$orderf/gmx;
    $body =~ s/\$orderc/$orderc/gmx;    
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
