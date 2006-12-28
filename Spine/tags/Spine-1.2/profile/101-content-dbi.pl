#!/usr/bin/perl

use strict;
use Test::Simple tests=>10;
use DBI;
use SPINE::DBI::Content;
use Data::Dumper;

my $dbh = DBI->connect("dbi:mysql:dbname=test","spine","spine") or die "Could not connect to Database:$!";
my $content_dbi = SPINE::DBI::Content->new($dbh);
ok(ref($content_dbi) eq "SPINE::DBI::Content","Return type: Content DBI object");
ok(ref($content_dbi->get({name=>"index.html",count=>1})) eq "ARRAY","Return type: get returns array ref");
my $content = shift @{$content_dbi->get({name=>"index.html",count=>1})};
ok(ref($content) eq "SPINE::Base::Content","Return type: get returns base object");
ok($content->name,"Object Attribute");
ok(ref($content_dbi->getlist()) eq "ARRAY","Return type: getlist returns array ref");
$content = shift @{$content_dbi->getlist()};
ok(ref($content) eq "" && $content,"Return type: getlist returns object name");

# ------------------------------

$content = shift @{ $content_dbi->get("name"=>"index.html") };
ok($content->keywords,"Object attribute: keywords");

$content = $content_dbi->get("name"=>"bar");
ok(ref($content) eq "ARRAY" && scalar(@{$content}) == 0,"Return type: get of unknown content returns undef");

$content = shift @{ $content_dbi->get("name"=>"index.html") };
$content->name("bar"); 

ok($content->name() eq "bar","Object attribute: get after set");
$content_dbi->add($content);

$content = shift @{ $content_dbi->get("name"=>"bar") };
ok(ref($content) eq "SPINE::Base::Content","Return type: add new record check");

$content->keywords("test"); 
$content_dbi->update($content);

$content = $content_dbi->get("name"=>"bar");
ok($content->keywords eq "test","Return type: update keyword test");

$content_dbi->remove($content);

$content = $content_dbi->get("name"=>"bar");
ok(ref($content) eq "","Return type: get of unknown content returns undef");