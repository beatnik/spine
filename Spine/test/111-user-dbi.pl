#!/usr/bin/perl

use strict;
use Test::Simple tests=>9;
use DBI;
use SPINE::DBI::User;
use Data::Dumper;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


my $dbh = DBI->connect($dbistr||$ENV{'dbistr'}||"dbi:mysql:dbname=test",$username||$ENV{'tusername'}||"spine",$psname||$ENV{'tpass'}||"spine") or die "Could not connect to Database:$!";

my $message_dbi = SPINE::DBI::User->new($dbh);

# Check the objects/pre-requisites

ok(ref($message_dbi) eq "SPINE::DBI::User","Return type: Content DBI object");

# Read

ok(ref($message_dbi->get({login=>"admin"})) eq "ARRAY","Return type: get returns array ref");

# Read -- bad

my $mess_content = shift @{$message_dbi->get({'login'=>"somethingnonexistent",count=>1})};

ok ((!$mess_content),"Nothing should be returned with a bad name.");


# Read -- good

$mess_content = shift @{$message_dbi->get({login=>"admin"})};

ok (ref($mess_content) eq 'SPINE::Base::User',"This time we have something " . ref($mess_content));

ok ($mess_content->login() eq 'admin', "Got a record from User object");

# Create an adminaccess record

$message_dbi->add(SPINE::Base::User->new({
                                                   id=>0,
                                                   login=>'chookie',
                                                   usergroup=>'users',
                                                   password=>'blah',
                                                   fullname=>'John Q. Chookie',
                                                   email=>'john@chookie.com'
                                                   }));


# Copy User

$mess_content = shift @{$message_dbi->get({'login'=>"chookie",count=>1})};

$mess_content->login('chookie2');

$message_dbi->add($mess_content);

my $mess_cont1 = shift @{$message_dbi->get({'login'=>"chookie2",count=>1})};

ok ($mess_cont1->login() eq 'chookie2', "New element created.");

# Update User group

my $mess_cont2 = shift @{$message_dbi->get({'login'=>"chookie2",count=>1})};

$mess_cont2->login('somethingphony');

$message_dbi->update($mess_cont2);

my $mess_cont3 = shift @{$message_dbi->get({'login'=>"somethingphony",count=>1})};

ok ($mess_cont3->login() eq 'somethingphony', "User setting successfully changed.");

# Delete User group

$message_dbi->remove($mess_content);

my $mess_missing = shift @{$message_dbi->get({'login'=>"chookie",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");

$message_dbi->remove($mess_cont1);

$mess_missing = shift @{$message_dbi->get({'login'=>"chookie2",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");


1;
