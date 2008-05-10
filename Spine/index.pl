#!/usr/bin/perl

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

use strict;

use SPINE::Transparent::Request;
use SPINE::DBI::Session; 
use SPINE::Base::Session;
use SPINE::Handler::Content;
use SPINE::DBI::User;
use SPINE::Constant;

use CGI;
use CGI::Cookie;
use Carp;
use Data::Dumper;
use CGI::Carp qw(fatalsToBrowser);
use Digest::MD5 qw(md5_hex);

use vars qw($VERSION $dbh);

$VERSION = $SPINE::Constant::VERSION;

use constant DBD=>'mysql'; #This is the default database type
use constant DB=>'spine'; #This is the default database
use constant DBUSER=>'hendrik'; #This is the default database user
use constant DBPWD=>'foobar'; #This is the default database user password
#See the POD on how to change this stuff without editing this code

sub initialise #Hope this subroutine does not get called constantly
{ my $DBD_ = DBD;
  my $DB_ = DB;
  my $DBUSER_ = DBUSER;
  my $DBPWD_ = DBPWD;  
  my $dbh = DBI->connect("dbi:$DBD_:dbname=$DB_",$DBUSER_,$DBPWD_) or croak "Could not connect to Database:$!"; 
  return $dbh;
}

# uri: /spine/   or /spine/foo.html
# uri = $location + / $page
# location: /spine 
# filename: /var/www/spine  or /var/www/spine/

sub handler 
{ my $cgi = CGI->new;
  my $req = SPINE::Transparent::Request->new($cgi);
  $req->setconfig("main" => "index.html", "images"=>"/images/");
  my $location = $req->location("/cgi-bin/index.pl");
  $dbh = &initialise(); 
  my $cookie = undef;
  #Just go ahead and use Apache::Request from now on
  my $user_dbi = SPINE::DBI::User->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);
  my $session = undef; #Store generated Session here
  #Pass the DBH to most SPINE::DBI::* modules
  my $content = SPINE::Handler::Content::handler($req,$dbh,"");
  if (ref($content) ne "SPINE::Base::Content") { return $content; }
  my $type = $content->type || 'text/html';
  my $body = $content->body;
  if ($req->param('name') && $req->param('password') && $req->param('button') eq 'login') 
  #Pressed login button??
  { my $user = shift @{$user_dbi->get({login=>scalar($req->param('name')),password=>md5_hex(scalar($req->param('password')))})};
    if ($user)
    { my @chars = ("a".."z","A".."Z",0..9);
      my $randid = join("",@chars[map{ rand @chars} (1..64)]);
      $cookie = CGI::Cookie->new(
                             -name    =>  'key', 
                             -value   =>  $randid,
                             -expires =>  '+3M', 
                             #-domain  =>  $req->hostname,
                             -path    =>  $req->location,
                             -secure  =>  0 
                            ); 
      my ($sec,$min,$hour,$mday,$mon,$year) = localtime(time);
      $year += 1900; $mon++;
      my $sdate = "$year-$mon-$mday $hour:$min:$sec";
      $session = SPINE::Base::Session->new({id=>$randid,username=>scalar($req->param('name')),expires=>'',sessiondate=>$sdate,host=>$req->remote_host});
      $session_dbi->add($session);
    }
  }
  if ($req->param('button') && $req->param('button') eq 'logout')
  #Log out??
  { my %cookies = CGI::Cookie->fetch;
    $session_dbi->remove($cookies{'key'}->value) if $cookies{'key'};
    #Check if a cookie exists with key key.. Delete the session if it does
    $cookie = CGI::Cookie->new(
                             -name    =>  'key', 
                             -value   =>  '',
                             -expires =>  '-1M', 
                             #-domain  =>  $req->hostname,
                             -path    =>  $req->location,
                             -secure  =>  0 
                            ); 
  }

  print $cgi->header(-type=>$type,
                     -expires=>'now',
	                 -cookie=>$cookie,
                     -Pragma=>'no-cache');
  while ($body =~ s/(<\?SPINE_([^\?]*)\?>)/process_handler($1,$2,$dbh,$req,$content)/mxge) 
  { $body =~ s/<\?SPINE_Location\?>/$location/mxg;
    $body =~ s/<\?SPINE_Servername\?>/$ENV{SERVER_NAME}/mxg; 
  }
  #I hope this doesn't come back to hunt me
  print($body);
}

sub process_handler #Ofcourse I could've done this pure inline, but I'm lazy
{ my $tag = shift; #This is the entire tag.. you never know if they might want to parse it themselves
  my $module = shift; #The module: SPINE_Foo -> SPINE::Handler::Foo
  my $dbh = shift; #Keep it threadsafe! Retrieve DB Handler from parameter
  my $req = shift; #Keep it threadsafe! Retrieve DB Handler from parameter
  my $content = shift; #Keep it threadsafe! Retrieve DB Handler from parameter
  $dbh = $dbh; #For some reason, removing this breaks stuff... so don't remove!!
  $req = $req; #For some reason, removing this breaks stuff... so don't remove!!
  $content = $content; #For some reason, removing this breaks stuff... so don't remove!!
  my $value = "";
  $module =~ s/^(\w*).*/$1/gmx; #Just make sure it's all aboot letters..
  return if !$module;
  return if !$tag;
  eval qq{
    use SPINE::Handler::$module;
    \$value = SPINE::Handler::${module}::handler(\$req,\$dbh,\$tag,\$content);  #Call the handler method in that uhm handler
  };
  carp $@ if $@; #Warn if necessary
  return $value;
}

handler();

1;

__END__

=pod

=head1 NAME

Apache::SPINE::Index

=head1 DESCRIPTION

This is the Apache Content Handler for SPINE.

This handler will process all the HTTP requests to a certain apache location and pass data streams from and to the appropriate SPINE handlers.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.2 beta

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
