#!/usr/bin/perl

use strict;
use Test::Simple tests=>9;
use DBI;
use SPINE::DBI::Attribute;
use Data::Dumper;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


my $dbh = DBI->connect($dbistr||"dbi:mysql:dbname=test",$username||"spine",$psname||"spine") or die "Could not connect to Database:$!";

my $message_dbi = SPINE::DBI::Attribute->new($dbh);

# Check the objects/pre-requisites

ok(ref($message_dbi) eq "SPINE::DBI::Attribute","Return type: Content DBI object");

# Read

ok(ref($message_dbi->get({name=>"counter",section=>'stats',attr=>'_admin.css'})) eq "ARRAY","Return type: get returns array ref");

# Read -- bad

my $mess_content = shift @{$message_dbi->get({'name'=>"goof",count=>1})};

ok ((!$mess_content),"Nothing should be returned with a bad name.");


# Read -- good

my $mess_content = shift @{$message_dbi->get({name=>"counter",section=>'stats',attr=>'_admin.css'})};

ok (ref($mess_content) eq 'SPINE::Base::Attribute',"This time we have something " . ref($mess_content));

ok ($mess_content->attr() eq '_admin.css', "Got the news from Attribute object");

# Create an adminaccess record

$message_dbi->add(SPINE::Base::Attribute->new({
                                                   id=>0,
                                                   attr=>'.foobar/fakie',
                                                   section=>'stats',
                                                   name=>'counter',
                                                   value=>'99999'
                                                   }));


# Copy Attribute

$mess_content = shift @{$message_dbi->get({'attr'=>".foobar/fakie",count=>1})};

$mess_content->attr('.foobar/fakie2');

$message_dbi->add($mess_content);

my $mess_cont1 = shift @{$message_dbi->get({'attr'=>".foobar/fakie2",count=>1})};

ok ($mess_cont1->attr() eq '.foobar/fakie2', "New element created.");

# Update Attribute group

my $mess_cont2 = shift @{$message_dbi->get({'attr'=>".foobar/fakie2",count=>1})};

$mess_cont2->value('101');

$message_dbi->update($mess_cont2);

my $mess_cont3 = shift @{$message_dbi->get({'attr'=>".foobar/fakie2",count=>1})};

ok ($mess_cont3->value() eq '101', "User setting successfully changed.");

# Delete Attribute group

$message_dbi->remove($mess_content);

my $mess_missing = shift @{$message_dbi->get({'attr'=>".foobar/fakie",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");

$message_dbi->remove($mess_cont1);

my $mess_missing = shift @{$message_dbi->get({'attr'=>".foobar/fakie2",count=>1})};

ok ((!$mess_missing),"Remove worked ok.");


1;
