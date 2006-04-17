#!/usr/bin/perl -w
use strict;
use Test::Simple tests=>8;
use LWP;
use HTTP::Cookies;

my $testhost = "http://layla/dev";

my $browser = LWP::UserAgent->new; #Instantiate
my $cookies = HTTP::Cookies->new;
$browser->cookie_jar({ file => ".cookies.txt", autosave => 1 });

#Test 1
my $response = $browser->get($testhost.'/admin/navbar/');
my $ok = $response->content =~ /Edit\s*Navigation Bar/ && $response->content =~ /Remove\s*Navigation Bar/ && $response->content =~ /Copy\s*Navigation Bar/ && $response->content =~ /New\s*Navigation Bar/;
ok($ok, "Main navbar page #1");

#Test 2 - Copy Navbar
$response = $browser->post($testhost.'/admin/navbar/copy/',
["name"=>"foo",
 "target"=>"foo2"
]);
$ok = $response->content =~ /foo2/;
ok($ok, "Copy Navbar :");

#Test 3 - Load Navbar
$response = $browser->post($testhost.'/admin/navbar/edit/',
["name"=>"foo2",
]);
$ok = $response->content =~ /Navigation Bar Edit : foo2/;
ok($ok, "Load Navbar");

#Test 4 - Delete Navbar
$response = $browser->post($testhost.'/admin/navbar/remove/',
["name"=>"foo2",
]);
$ok = $response->content !~ /Navigation Bar Edit : foo2/;
ok($ok, "Delete Navbar");

#Test 5 - Create Navbar
$response = $browser->post($testhost.'/admin/navbar/new/',
["name"=>"foo2",
]);
$ok = $response->content =~ /foo2/;
ok($ok, "Create Navbar");

#Test 6 - Edit Navbar
$response = $browser->post($testhost.'/admin/navbar/edit/',
["name"=>"foo2",
]);
my ($id) = $response->content =~ /<input type="hidden" name="id" value="(\d*)">/;

$response = $browser->post($testhost.'/admin/navbar/addbutton/',
["name"=>"foo2",
 "id"=>$id,
 "position"=>1,
 "link"=>"http://spine.sf.net",
 "image"=>"http://spine.sourceforge.net/images/logo4.png",
 "label"=>"spine site"
]);

$ok = (($response->content =~ /spine\.sf\.net/) && ($response->content =~ /logo4\.png/) && ($response->content =~ /spine site/));

ok($ok, "Add Buttons #1");

$response = $browser->post($testhost.'/admin/navbar/addbutton/',
["name"=>"foo2",
 "id"=>$id,
 "position"=>2,
 "link"=>"http://www.perl.com",
 "image"=>"",
 "label"=>"perl site"
]);

$ok = (($response->content =~ /perl\.com/)  && ($response->content =~ /perl site/));

ok($ok, "Add Buttons #2");

$response = $browser->post($testhost.'/admin/navbar/editbutton/',
["name"=>"foo2",
 "id"=>$id,
 "position"=>2,
 "link"=>"http://www.perl.com",
 "image"=>"",
 "label"=>"perl site"
]);

$ok = (($response->content =~ /perl\.com/)  && ($response->content =~ /perl site/));

ok($ok, "Add Buttons #2");
