#!/usr/bin/perl -w
use Test::Harness;
use Getopt::Long;

my ($dbistr, $username, $psname);

my $result = GetOptions ("dbistr=s"=>\$dbistr,
                         "username=s"=>\$username,
                         "password=s"=>\$psname);


if($dbistr)
{
    $ENV{'dbistr'} = $dbistr;
    $ENV{'tusername'} = $username;
    $ENV{'tpass'} = $psname;    
}


my @files = ('107-messagegroup-dbi.pl',
             '106-macro-dbi.pl' ,
             '101-content-dbi.pl' ,
             '102-message-dbi.pl' ,
             '103-adminaccess-dbi.pl' ,
             '105-attribute-dbi.pl' ,
             '108-navbar-dbi.pl' ,
             '109-style-dbi.pl' ,
             '110-usergroup-dbi.pl' ,
             '111-user-dbi.pl'
             );

runtests(@files);

1;
