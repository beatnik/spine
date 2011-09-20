#!/usr/bin/perl

use strict;
use Test::Simple tests=>10;
use DBI;
use SPINE::DBI::Message;
use SPINE::DBI::Messagegroup;
use Data::Dumper;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


my $dbh = DBI->connect($dbistr||"dbi:mysql:dbname=test",$username||"spine",$psname||"spine") or die "Could not connect to Database:$!";

my $message_dbi = SPINE::DBI::Messagegroup->new($dbh);

# Check the objects/pre-requisites

ok(ref($message_dbi) eq "SPINE::DBI::Messagegroup","Return type: Content DBI object");

# Read

ok(ref($message_dbi->get({name=>"goof",count=>1})) eq "ARRAY","Return type: get returns array ref");

# Read -- bad

my $mess_content = shift @{$message_dbi->get({'name'=>"goof",count=>1})};

ok ((!$mess_content),"Nothing should be returned with a bad name.");


# Read -- good

my $mess_content = shift @{$message_dbi->get({'name'=>"news",count=>1})};

ok (ref($mess_content) eq 'SPINE::Base::Messagegroup',"This time we have something " . ref($mess_content));

ok ($mess_content->name() eq 'news', "Got the news from messagegroup object");

# Create message group

$message_dbi->add(SPINE::Base::Messagegroup->new({
                                                   id=>0,
                                                   name=>'attic50',
                                                   content=>'.message',
                                                   owner=>'admin',
                                                   usergroup=>'admin',
                                                   permissions=>'111111'
                                                   }));



# Create message entries



# Copy message group


# Update message group

# Update individual message


# Delete message entries

# Delete message group



1;
