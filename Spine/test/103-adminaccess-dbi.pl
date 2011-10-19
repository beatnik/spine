#!/usr/bin/perl

use strict;
use Test::Simple tests=>9;
use DBI;
use SPINE::DBI::Adminaccess;
use Data::Dumper;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


my $dbh = DBI->connect($dbistr||$ENV{'dbistr'}||"dbi:mysql:dbname=test",$username||$ENV{'tusername'}||"spine",$psname||$ENV{'tpass'}||"spine") or die "Could not connect to Database:$!";

my $message_dbi = SPINE::DBI::Adminaccess->new($dbh);

# Check the objects/pre-requisites

ok(ref($message_dbi) eq "SPINE::DBI::Adminaccess","Return type: Content DBI object");

# Read

ok(ref($message_dbi->get({section=>"message",count=>1})) eq "ARRAY","Return type: get returns array ref");

# Read -- bad

my $mess_content = shift @{$message_dbi->get({'section'=>"goof",count=>1})};

ok ((!$mess_content),"Nothing should be returned with a bad name.");


# Read -- good

$mess_content = shift @{$message_dbi->get({'section'=>"navbar",count=>1})};

ok (ref($mess_content) eq 'SPINE::Base::Adminaccess',"This time we have something " . ref($mess_content));

ok ($mess_content->section() eq 'navbar', "Got the news from Adminaccess object");

# Create an adminaccess record

$message_dbi->add(SPINE::Base::Adminaccess->new({
                                                   id=>0,
                                                   section=>'content',
                                                   usergroup=>'totallyfake',
                                                   permissions=>'000'
                                                   }));




# Copy Adminaccess

$mess_content = shift @{$message_dbi->get({'section'=>"content",'usergroup'=>'totallyfake',count=>1})};

$mess_content->usergroup('totallyfake2');

$message_dbi->add($mess_content);

my $mess_cont1 = shift @{$message_dbi->get({'section'=>"content",'usergroup'=>'totallyfake2',count=>1})};

ok ($mess_cont1->usergroup() eq 'totallyfake2', "New element created.");

# Update Adminaccess group

my $mess_cont2 = shift @{$message_dbi->get({'section'=>"content",'usergroup'=>'totallyfake2',count=>1})};

$mess_cont2->section('junk');

$message_dbi->update($mess_cont2);

my $mess_cont3 = shift @{$message_dbi->get({'section'=>"junk",'usergroup'=>'totallyfake2',count=>1})};

ok ($mess_cont3->usergroup() eq 'totallyfake2', "User setting successfully changed.");

# Delete Adminaccess group

$message_dbi->remove($mess_content);

my $mess_missing = shift @{$message_dbi->get({'usergroup'=>"totallyfake",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");

$message_dbi->remove($mess_cont1);

$mess_missing = shift @{$message_dbi->get({'usergroup'=>"totallyfake2",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");


1;
