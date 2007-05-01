#!/usr/bin/perl

use strict;
use Test::More tests=>10;
use SPINE::Base::Content;
use Data::Dumper;
use Carp;

my %content = 
( name => "test.html", 
  keywords => "foo",
  body => "foo",
  id => 1,
  title => "foo",
  breaks => "1",
  style => "foo",
  macros => "foo",
  logging => "foo",
  owner => "foo",
  usergroup => "foo",
  permissions => "foo",
  icomment => "foo",
  type => "foo");

my $content = SPINE::Base::Content->new(\%content);

ok(ref($content) eq "SPINE::Base::Content","Create a Content object");
my %hash = $content->tohash;
ok(%hash eq %content,"tohash test");

ok(length($hash{body}) eq $content->size,"Content body size");
