#!/usr/bin/perl -w
use strict;
use Test::Simple tests=>5;
use LWP;
use HTTP::Cookies;

my $testhost = "http://layla/dev";

my $browser = LWP::UserAgent->new; #Instantiate
my $cookies = HTTP::Cookies->new;
$browser->cookie_jar({ file => ".cookies.txt", autosave => 1 });

#Test 1
my $response = $browser->get($testhost.'/admin/style/');
my $ok = $response->content =~ /Edit\s*style/ && $response->content =~ /Remove\s*style/ && $response->content =~ /Copy\s*style/ && $response->content =~ /New\s*style/;
ok($ok, "Main style page #1");

#Test 2 - Create
$response = $browser->post($testhost.'/admin/style/new/',
["name"=>"teststyle"]);
$ok = $response->content =~ /Style Edit : teststyle/;
ok($ok, "Create style #1");

#Test 3 - Save
$response = $browser->post($testhost.'/admin/style/save/',
["name"=>"teststyle",
 "title"=>"Test Title",
 "macros"=>"main",
 "body"=>"test testing", 
 "icomment"=>"test comment"
 #Add more fields here
]);
$ok = $response->content =~ /Style Edit : teststyle/;
ok($ok, "Create style page #2");

#Test 4 - Load
$response = $browser->post($testhost.'/admin/style/edit/',
["name"=>"teststyle"]);
$ok = (
 $response->content =~ /<input .*?name="title" value="Test Title"/ &&
 $response->content =~ /value="main" selected>main/ &&
 $response->content =~ /<textarea .*?name="body".*? class="input">test testing/
);

ok($ok, "Load style #1");

#Test 5 - Remove
$response = $browser->post($testhost.'/admin/style/remove/',
["name"=>"teststyle"]);
$ok = $response->content !~ /teststyle/;
ok($ok, "Remove style #1");
