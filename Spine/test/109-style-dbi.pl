#!/usr/bin/perl

use strict;
use Test::Simple tests=>9;
use DBI;
use SPINE::DBI::Style;
use Data::Dumper;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


my $dbh = DBI->connect($dbistr||$ENV{'dbistr'}||"dbi:mysql:dbname=test",$username||$ENV{'tusername'}||"spine",$psname||$ENV{'tpass'}||"spine") or die "Could not connect to Database:$!";

my $message_dbi = SPINE::DBI::Style->new($dbh);

# Check the objects/pre-requisites

ok(ref($message_dbi) eq "SPINE::DBI::Style","Return type: Content DBI object");

# Read

ok(ref($message_dbi->get({name=>"news"})) eq "ARRAY","Return type: get returns array ref");

# Read -- bad

my $mess_content = shift @{$message_dbi->get({'name'=>"somethingnonexistent",count=>1})};

ok ((!$mess_content),"Nothing should be returned with a bad name.");


# Read -- good

$mess_content = shift @{$message_dbi->get({name=>"main"})};

ok (ref($mess_content) eq 'SPINE::Base::Style',"This time we have something " . ref($mess_content));

ok ($mess_content->name() eq 'main', "Got a record from Style object");

# Create an adminaccess record

$message_dbi->add(SPINE::Base::Style->new({
                                                   id=>0,
                                                   name=>'chookie',
                                                   title=>'none',
                                                   macros=>'',
                                                   modified=>'2011-01-01 01:01:00',
                                                   owner=>'admin',
                                                   usergroup=>'users',
                                                   permissions=>'1010',
                                                   body=>'this is fake content',
                                                   icomment=>'blah, blah, blah'
                                                   }));


# Copy Style

$mess_content = shift @{$message_dbi->get({'name'=>"chookie",count=>1})};

$mess_content->name('chookie2');

$message_dbi->add($mess_content);

my $mess_cont1 = shift @{$message_dbi->get({'name'=>"chookie2",count=>1})};

ok ($mess_cont1->name() eq 'chookie2', "New element created.");

# Update Style group

my $mess_cont2 = shift @{$message_dbi->get({'name'=>"chookie2",count=>1})};

$mess_cont2->permissions('1011');

$message_dbi->update($mess_cont2);

my $mess_cont3 = shift @{$message_dbi->get({'name'=>"chookie2",count=>1})};

ok ($mess_cont3->permissions() eq '1011', "User setting successfully changed.");

# Delete Style group

$message_dbi->remove($mess_content);

my $mess_missing = shift @{$message_dbi->get({'name'=>"chookie",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");

$message_dbi->remove($mess_cont1);

$mess_missing = shift @{$message_dbi->get({'name'=>"chookie2",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");


1;
