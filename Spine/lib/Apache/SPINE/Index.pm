package Apache::SPINE::Index;

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

#This is the main content handler for mod_spine
#This is the ONLY content handler for mod_spine... for now

use strict;
use Apache::Constants qw(:common REDIRECT);
use Apache::Request; #This one is SWEEEEEEEEEEET!!
use Apache::Cookie;
use Apache::Log;

use SPINE::DBI::Session; 
use SPINE::Base::Session;
use SPINE::Handler::Content;
use SPINE::DBI::User;
use SPINE::Constant;

use Digest::MD5 qw(md5_hex);

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

use constant DBD=>'mysql'; #This is the default database type
use constant DB=>'spine'; #This is the default database
use constant DBUSER=>'root'; #This is the default database user
use constant DBPWD=>''; #This is the default database user password
#See the POD on how to change this stuff without editing this code

sub initialise #Hope this subroutine does not get called constantly
{ my $r = shift;
  my $DBD_ = $r->dir_config("dbd") || DBD;
  my $DB_ = $r->dir_config("dbname") || DB;
  my $DBUSER_ = $r->dir_config("dbuser") || DBUSER;
  my $DBPWD_ = $r->dir_config("dbpwd") || DBPWD;  
  my $dbh = DBI->connect("dbi:$DBD_:dbname=$DB_",$DBUSER_,$DBPWD_) or die "Could not connect to Database:$!"; 
  return $dbh;
  #But yes, I do recommend using Apache::DBI
  #Ofcourse, mod_spine wouldn't notice if you didn't
}

sub handler 
{ my $r = shift;
  my $page = $r->uri;
  my $location = $r->location;
  $page =~ s/$location//;
  my $file = $r->filename; 
  my $uri = $r->uri; 
  my $dbh = undef;
  if ($r->uri && -e $r->document_root.$uri && $page ne '/') { return DECLINED; }
  #We pretend to know how to handle files that actually exist!!
  if (!$dbh) { $dbh = &initialise($r); }
  my $cookie = undef;
  my $req = Apache::Request->new($r);
  #Just go ahead and use Apache::Request from now on
  my $user_dbi = SPINE::DBI::User->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);
  my $session = undef; #Store generated Session here
  #Pass the DBH to most SPINE::DBI::* modules
  if ($req->param('name') && $req->param('password') && $req->param('button') eq 'login') 
  #Pressed login button??
  { my $user = shift @{$user_dbi->get({login=>$req->param('name'),password=>md5_hex($req->param('password'))})};
    if ($user)
    { my @chars = ("a".."z","A".."Z",0..9);
      my $randid = join("",@chars[map{ rand @chars} (1..64)]);
      $cookie = Apache::Cookie->new($req,
                             -name    =>  'key', 
                             -value   =>  $randid,
                             -expires =>  '+3M', 
                             #-domain  =>  $req->hostname,
                             #-path    =>  $req->location,
                             -secure  =>  0 
                            ); 
      $req->header_out('Set-Cookie'=>$cookie->as_string);
      my ($sec,$min,$hour,$mday,$mon,$year) = localtime(time);
      $year += 1900; $mon++;
      my $sdate = "$year-$mon-$mday $hour:$min:$sec";
      $session = SPINE::Base::Session->new({id=>$randid,username=>scalar($req->param('name')),expires=>'',sessiondate=>$sdate,host=>$req->get_remote_host});
      $session_dbi->add($session);
      #User exists?? Generate session and set cookie
    }
  }
  if ($req->param('button') eq 'logout')
  #Log out??
  { my %cookies = Apache::Cookie->fetch;
    $session_dbi->delete($cookies{'key'}->value) if $cookies{'key'};
    #Check if a cookie exists with key key.. Delete the session if it does
    $cookie = Apache::Cookie->new($req,
                             -name    =>  'key', 
                             -value   =>  '',
                             -expires =>  '-1M', 
                             #-domain  =>  $req->hostname,
                             #-path    =>  $req->location,
                             -secure  =>  0 
                            ); 
      $req->header_out('Set-Cookie'=>$cookie->as_string);
      #Ofcourse, we should delete the cookie as well
  }
  #Only header is required???
  my $content = SPINE::Handler::Content::handler($req,$dbh,$session);
  if (ref($content) ne "SPINE::Base::Content") { return $content; }
  my $type = $content->type || 'text/html';
  my $body = $content->body;
  my $location = $req->location;
  $req->no_cache(1);
  $req->content_type($type);
  $req->send_http_header;
  return OK if $req->header_only;
  while ($body =~ s/(<\?SPINE_([^\?]*)\?>)/process_handler($1,$2,$dbh,$req,$content)/ge) 
  { $body =~ s/<\?SPINE_Location\?>/$location/g;
    $body =~ s/<\?SPINE_Servername\?>/$ENV{SERVER_NAME}/g; 
  }
  #I hope this doesn't come back to hunt me
  $req->print($body);
  return OK;
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
  $module =~ s/^(\w*).*/$1/g; #Just make sure it's all aboot letters..
  return if !$module;
  return if !$tag;
  eval qq{
    use SPINE::Handler::$module;
    \$value = SPINE::Handler::${module}::handler(\$req,\$dbh,\$tag,\$content);  #Call the handler method in that uhm handler
  };
  warn $@ if $@; #Warn if necessary
  return $value;
}

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
