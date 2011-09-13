#!/usr/bin/perl -w

use Test::More tests => 17;

use_ok ('Apache2::Const ');
use_ok ('Apache2::Request');
use_ok ('Apache2::RequestIO');
use_ok ('Apache2::Connection');
use_ok ('Apache2::Cookie');
use_ok ('Apache2::Log');

use_ok ('SPINE::DBI::Session');
use_ok ('SPINE::DBI::Attribute'); 
use_ok ('SPINE::Base::Session');
use_ok ('SPINE::Handler::Content');
use_ok ('SPINE::DBI::Action');
use_ok ('SPINE::Constant');

use_ok ('SPINE::Transparent::Request');
use_ok ('SPINE::Transparent::Constant');

use_ok ('Data::Dumper');
use_ok ('Carp');
use_ok ('Digest::MD5');


diag( "Testing SPINE modules $SPINE::Handler::Content::VERSION, Perl $], $^X" );

1;
