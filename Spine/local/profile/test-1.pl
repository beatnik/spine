#!/usr/bin/perl

use strict;
use DBI;
use SPINE::DBI::Content;

my $dbh = DBI->connect("dbi:mysql:dbname=test","spine","spine") or die "Could not connect to Database:$!";
my $content_dbi = SPINE::DBI::Content->new($dbh);
my $c = $content_dbi->get({name=>"index.html",count=>1});

