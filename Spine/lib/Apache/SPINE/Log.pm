package Apache::SPINE::Log;

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

#This is the log handler for mod_spine

use warnings;
use strict;
use Apache::Constants qw(:common);
use SPINE::DBI::Content;
use SPINE::Constant;
use DBI;
use Data::Dumper;

use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

use constant DBD=>'mysql';
use constant DB=>'spine';
use constant DBUSER=>'user';
use constant DBPWD=>'';

sub handler 
{ my $r = shift;

  my $DBD_ = $r->dir_config("dbd") || DBD;
  my $DB_ = $r->dir_config("dbname") || DB;
  my $DBUSER_ = $r->dir_config("dbuser") || DBUSER;
  my $DBPWD_ = $r->dir_config("dbpwd") || DBPWD;  
  my $main = $r->dir_config("main") || "index.html";
  my $dbh = DBI->connect("dbi:$DBD_:dbname=$DB_",$DBUSER_,$DBPWD_) or die "Could not connect to Database:$!"; 
  my ($sec,$min,$hour,$day,$mon,$year) = localtime;
  $mon++; $year += 1900;
  my $date = "$year-$mon-$day $hour:$min:$sec";
  my $file = $r->uri;
  my $location = $r->location;
  $file =~ s/^$location\/?//mx;
  $file ||= $main;
  $file =~ s/^(.*?)\/.*$/$1/mxg;
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $content = shift @ { $content_dbi->get({ name => $file }) };
  if (!$content) { return DONE; }
  if (!$content->logging) { return DONE; }
  my (@data) =
  #$name,$date,$useragent,$remoteaddr,$referer,$query) = 
  ($file,$date,$r->header_in("User-Agent"),$r->get_remote_host,$r->header_in("Referer"),scalar($r->args));
  my $add = "insert into statistics (name, sdate, useragent, remoteaddr, referer, query) values ( \'".join(qq(','),@data)."\')"; 
  my $sth = $dbh->prepare($add);
  $sth->execute();
  $sth->finish;
  # Support separate counter - speeds up stats
  my $counter = qq(select id, attr, value from attribute where attr = ? and section = 'stats' and name = 'counter');
  $sth = $dbh->prepare($counter);
  $sth->execute($file);
  my $counter_ref = $sth->fetchrow_hashref();
  $sth->finish;
  my %hash = ();
  if (ref($counter_ref))
  { %hash = %{$counter_ref}; $hash{"value"}++;  
    $add = qq(update attribute set value = $hash{"value"} where id = $hash{"id"});
  } else
  { $hash{"value"} = 1; $hash{"attr"} = $file; $hash{"section"} = "stats"; $hash{"name"} = "counter"; 
    $add = qq(insert into attribute (attr, name, section, value) values ( \'$hash{"attr"}\',\'$hash{"name"}\',\'$hash{"section"}\',\'$hash{"value"}\'));
  }
  $sth = $dbh->prepare($add);
  $sth->execute();
  $sth->finish;
  $dbh->disconnect;
  return DONE;
}

1;
__END__

=pod

=head1 NAME

Apache::SPINE::Log

=head1 DESCRIPTION

This is the Apache Log Handler for SPINE.

It will make sure all requests are currently logged in the database so that graphs can be generated from the statistical data.

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
