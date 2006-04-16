#!/usr/bin/perl

use lib qw(lib);
use strict;
use SPINE::Base::Content;
use SPINE::DBI::Content;
use SPINE::Lite::Content;

use SPINE::Base::Style;
use SPINE::DBI::Style;
use SPINE::Lite::Style;

use SPINE::Base::User;
use SPINE::DBI::User;
use SPINE::Lite::User;


use Data::Dumper;
use Digest::MD5 qw(md5_hex);
use DBI;

my $dbh = DBI->connect("dbi:mysql:spine","root","foobar") or die "Could not connect to Database:$!";  

#&content;
#&style;
&user;


sub content
{ my $dbi = SPINE::DBI::Content->new($dbh);
  my @content = <content/*.content>;
  for(@content) 
  { my ($file,$foo) = split(/\./,$_);
    $file =~ s/^.*\///;
    my $c = SPINE::Lite::Content->new({file=>$file});
    print "processing $file...\n";
    my $content = SPINE::Base::Content->new
    ({id=>0, 
      breaks=>$c->breaks,
      title=>$c->title,
      access=>$c->access,
      style=>$c->style,
      macros=>$c->macro,
      logging=>$c->logging,
      keywords=>$c->keywords,
      body=>$c->body,
      name=>$c->file,
      owner=>'root',
      usergroup=>$c->access,
      permissions=>'------',
      modified=>''
   });
   $dbi->add($content);
  }
  print "\n";
}

sub style
{ my $dbi = SPINE::DBI::Style->new($dbh);
  my @style = <style/*.style>;
  for(@style) 
  { my ($file,$foo) = split(/\./,$_);
    $file =~ s/^.*\///;
    my $c = SPINE::Lite::Style->new({file=>$file});
    print "processing $file...\n";
    my $style = SPINE::Base::Style->new
    ({id=>0, 
      title=>$c->title,
      macros=>$c->macro,
      owner=>'root',
      usergroup=>$c->access,
      permissions=>'------',
      body=>$c->body,
      name=>$c->file,
   });    
   $dbi->add($style);
  }
  print "\n";
}

sub user
{ my $dbi = SPINE::DBI::User->new($dbh);
  my @style = <users/*.db>;
  for(@style) 
  { my ($file,$foo) = split(/\./,$_);
    $file =~ s/^.*\///;
    my $c = SPINE::Lite::User->new({file=>$file});
    print "processing $file...\n";
    for my $u ($c->list($file))
    { my $passwd = md5_hex("foo");
      my $user = SPINE::Base::User->new
      ({id=>0, 
        usergroup=>$file,
        name=>$u,
        password=>$passwd
     });
     $dbi->add($user);
    }
  }
  print "\n";
}