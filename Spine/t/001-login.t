#!/usr/bin/perl -w
use strict;
use Test::Simple tests=>1;
use LWP;
use HTTP::Cookies;

my $testhost = "http://lua/spine";

my $browser = LWP::UserAgent->new; #Instantiate
my $cookies = HTTP::Cookies->new;
$browser->cookie_jar({ file => ".cookies.txt", autosave => 1 });
my $response = $browser->post($testhost."/login.html",
['name'=>'admin', #User
'password'=>'foo', #Password
'button'=>'login'
],
);
$cookies->extract_cookies($response);
$response = $browser->get($testhost."/login.html");
ok($response->content =~ /You are logged in/, "Login Test")


