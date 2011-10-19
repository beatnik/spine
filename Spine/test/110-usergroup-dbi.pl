#!/usr/bin/perl

use strict;
use Test::Simple tests=>9;
use DBI;
use SPINE::DBI::Usergroup;
use Data::Dumper;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


my $dbh = DBI->connect($dbistr||$ENV{'dbistr'}||"dbi:mysql:dbname=test",$username||$ENV{'tusername'}||"spine",$psname||$ENV{'tpass'}||"spine") or die "Could not connect to Database:$!";

my $message_dbi = SPINE::DBI::Usergroup->new($dbh);

# Check the objects/pre-requisites

ok(ref($message_dbi) eq "SPINE::DBI::Usergroup","Return type: Content DBI object");

# Read

ok(ref($message_dbi->get({username=>"admin"})) eq "ARRAY","Return type: get returns array ref");

# Read -- bad

my $mess_content = shift @{$message_dbi->get({'username'=>"somethingnonexistent",count=>1})};

ok ((!$mess_content),"Nothing should be returned with a bad name.");


# Read -- good

$mess_content = shift @{$message_dbi->get({username=>"admin"})};

ok (ref($mess_content) eq 'SPINE::Base::Usergroup',"This time we have something " . ref($mess_content));

ok ($mess_content->username() eq 'admin', "Got a record from Usergroup object");

# Create an adminaccess record

$message_dbi->add(SPINE::Base::Usergroup->new({
                                                   id=>0,
                                                   username=>'chookie',
                                                   usergroup=>'users'
                                                   }));


# Copy Usergroup

$mess_content = shift @{$message_dbi->get({'username'=>"chookie",count=>1})};

$mess_content->username('chookie2');

$message_dbi->add($mess_content);

my $mess_cont1 = shift @{$message_dbi->get({'username'=>"chookie2",count=>1})};

ok ($mess_cont1->username() eq 'chookie2', "New element created.");

# Update Usergroup group

my $mess_cont2 = shift @{$message_dbi->get({'username'=>"chookie2",count=>1})};

$mess_cont2->usergroup('somethingphony');

$message_dbi->update($mess_cont2);

my $mess_cont3 = shift @{$message_dbi->get({'username'=>"chookie2",count=>1})};

ok ($mess_cont3->usergroup() eq 'somethingphony', "User setting successfully changed.");

# Delete Usergroup group

$message_dbi->remove($mess_content);

my $mess_missing = shift @{$message_dbi->get({'username'=>"chookie",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");

$message_dbi->remove($mess_cont1);

$mess_missing = shift @{$message_dbi->get({'username'=>"chookie2",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");


1;
