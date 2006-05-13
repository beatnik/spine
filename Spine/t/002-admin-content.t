#!/usr/bin/perl -w
use strict;
use Test::More tests=>15;
use LWP;
use HTTP::Cookies;

my $testhost = "http://lua/spine";

#Create test user?
#Create content that is restricted

my $browser = LWP::UserAgent->new; #Instantiate
my $cookies = HTTP::Cookies->new;
$browser->cookie_jar({ file => ".cookies.txt", autosave => 1 });

#Test 1 - Load content admin page
my $response = $browser->get($testhost.'/admin/');
my $ok = $response->content =~ /Edit\s*content/ && $response->content =~ /Remove\s*content/ && $response->content =~ /Copy\s*content/ && $response->content =~ /New\s*content/;
ok($ok, "Main content page #1");

#Test 2 - Load content admin page - alternative
$response = $browser->get($testhost.'/admin/content/');
$ok = $response->content =~ /Edit\s*content/ && $response->content =~ /Remove\s*content/ && $response->content =~ /Copy\s*content/ && $response->content =~ /New\s*content/;
ok($ok, "Main content page #2");

#Test 3 - Create Content
$response = $browser->post($testhost.'/admin/content/new/',
["name"=>"testcontent"]);
$ok = $response->content =~ /Content Edit : testcontent/;

ok($ok, "Create Content");

#Test 4 - Create testcontent AGAIN.. see what happens
$response = $browser->post($testhost.'/admin/content/new/',
["name"=>"testcontent"]);
$ok = $response->content =~ /This Content already exists!/;
ok($ok, "Create testcontent AGAIN.. see what happens");

#Test 5 - Save
$response = $browser->post($testhost.'/admin/content/save/',
["name"=>"testcontent",
 "type"=>"text/html",
 "title"=>"Test Title",
 "breaks"=>"1",
 "style"=>"main",
 "logging"=>"1",
 "macros"=>"main",
 "keywords"=>"test testing",
 "body"=>"test testing", 
]);
$ok = $response->content =~ /Content Edit : testcontent/;
ok($ok, "Save content");

#Test 6 - Load
$response = $browser->post($testhost.'/admin/content/edit/',
["name"=>"testcontent"]);
$ok = (
 $response->content =~ /<input .*?name="title" value="Test Title/ &&
 $response->content =~ /<input .*?checked name="breaks/ &&
 $response->content =~ /<input .*?name="type" value="text\/html/ &&
 $response->content =~ /value="main" selected>main/ &&
 $response->content =~ /value="main" selected>main/ &&
 $response->content =~ /<input .*?name="keywords" value="test testing/ &&
 $response->content =~ /<textarea .*?name="body" class="input">test testing/
);
ok($ok, "Load Content");

#Test 7 - Save unexisting content
$response = $browser->post($testhost.'/admin/content/save/',
["name"=>"thisbetternotexist",
 "type"=>"text/html",
 "title"=>"Test Title",
 "breaks"=>"1",
 "style"=>"main",
 "logging"=>"1",
 "macros"=>"main",
 "keywords"=>"test testing",
 "body"=>"test testing", 
]);
$ok = $response->content =~ /This Content does not exist!/;
ok($ok, "Save unexisting content");

#Test 8 - Save existing (but access restricted) content 
$response = $browser->post($testhost.'/admin/content/save/',
["name"=>"thisbetternotexist",
 "type"=>"text/html",
 "title"=>"Test Title",
 "breaks"=>"1",
 "style"=>"main",
 "logging"=>"1",
 "macros"=>"main",
 "keywords"=>"test testing",
 "body"=>"test testing", 
]);
$ok = $response->content =~ /does not exist/;
ok($ok, "Save existing (but access restricted) content");

#Test 9 - Copy
$response = $browser->post($testhost.'/admin/content/copy/',
["name"=>"testcontent","target"=>"testcontent2"]);
$ok = $response->content =~ /testcontent2/;
ok($ok, "Copy Content");

#Test 10 - Copy unexisting file
$response = $browser->post($testhost.'/admin/content/copy/',
["name"=>"makesurethiscontentdoesntexist","target"=>"testcontent3"]);
$ok = $response->content =~ /This Content does not exist!/;
ok($ok, "Copy unexisting file");

#Test 11 - Copy to existing file
$response = $browser->post($testhost.'/admin/content/copy/',
["name"=>"testcontent","target"=>"testcontent4"]);
$ok = $response->content =~ /testcontent4/;
ok($ok, "Copy to existing file");

SKIP: {
skip "Add restricted file", 1;
#Test 12 - Copy restricted file
$response = $browser->post($testhost.'/admin/content/copy/',
["name"=>"restrictedfile","target"=>"testcontent5"]);
$ok = $response->content !~ /testcontent4/;
ok($ok, "Copy restricted file");
}

#Test 13 - Remove
$response = $browser->post($testhost.'/admin/content/remove/',
["name"=>"testcontent2"]);
$ok = $response->content !~ /testcontent2/;
ok($ok, "Remove content");

#Test 14 - Remove an unexisting file
$response = $browser->post($testhost.'/admin/content/remove/',
["name"=>"makesurethiscontentdoesntexist"]);
$ok = $response->content =~ /does not exist/;
ok($ok, "Remove an unexisting file");

SKIP: {
skip "Add restricted file", 1;
#Test 15 - Remove an restricted file
$response = $browser->post($testhost.'/admin/content/remove/',
["name"=>"makesurethiscontentdoesntexist"]);
$ok = $response->content !~ /testcontent/;
ok($ok, "Remove an restricted file");
}