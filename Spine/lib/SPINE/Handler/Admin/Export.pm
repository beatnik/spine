package SPINE::Handler::Admin::Export;

## This module is part of SPINE
## Copyright 2000-2005 Hendrik Van Belleghem
## SPINE is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.

## SPINE is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with Foobar; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

## See COPYING and LICENSE for more information on the GPL   
## http://spine.sourceforge.net                  
## beatnik@users.sf.org        

#Apache::Request Handler
#DB Handler

use strict;

use vars qw($VERSION);

use SPINE::Constant;
use SPINE::DBI::Attribute;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::DBI::Style;
use SPINE::DBI::Navbar;
use SPINE::DBI::Button;
use SPINE::DBI::Message;
use SPINE::DBI::Messagegroup;
use SPINE::DBI::User;

use SPINE::Base::Content;

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  my $adminaccess_dbi = SPINE::DBI::Adminaccess->new($dbh);
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $style_dbi = SPINE::DBI::Style->new($dbh);  
  my $navbar_dbi = SPINE::DBI::Navbar->new($dbh);
  my $message_dbi = SPINE::DBI::Message->new($dbh);  
  my $button_dbi = SPINE::DBI::Button->new($dbh);  
  my $messagegroup_dbi = SPINE::DBI::Messagegroup->new($dbh);
  my $body = qq(Type: <form method="post" action="admin/export"><select name="type"><option>attribute<option>adminaccess<option>content<option>style<option>navbar<option>message<option>messagegroup<option>button</select><input type="submit"></form>);
  my $type = $request->param('type');
  my  @list = ();
  if ($type eq "attribute")
  { @list = @{ $attribute_dbi->get() }; }
  if ($type eq "adminaccess")
  { @list = @{ $adminaccess_dbi->get() }; }
  if ($type eq "content")
  { @list = @{ $content_dbi->get() }; }
  if ($type eq "style")
  { @list = @{ $style_dbi->get() }; }
  if ($type eq "navbar")
  { @list = @{ $navbar_dbi->get() }; }
  if ($type eq "message")
  { @list = @{ $message_dbi->get() }; }
  if ($type eq "messagegroup")
  { @list = @{ $messagegroup_dbi->get() }; }
  if ($type eq "button")
  { @list = @{ $button_dbi->get() }; }
  for(@list)
  { my %hash = $_->tohash;
    $body .= "insert into $type (";
    my @keys = sort keys %hash;
    while ($_ = shift(@keys))
    { $body .= $_;
      $body .= "," if @keys;
    }
    $body .= ") values (";
    @keys = sort keys %hash;
    while($_ = shift(@keys))
    { my $f = $hash{$_};
      $f =~ s/\"/\\\"/gmx;
      $f =~ s/\'/\\\'/gmx;
      $f =~ s/\n/\\n/gmx;
      $f =~ s/\r/\\r/gmx;
      $f =~ s/</\&lt;/gmx;
      $f =~ s/>/\&gt;/gmx;
      $body .= qq('$f');
      $body .= "," if @keys;
    }
    $body .= ");\n";
  }
  return SPINE::Base::Content->new({body=>"<pre>$body</pre>",style=>".admin"});
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Env

=head1 DESCRIPTION

This is the Environment Handler for SPINE.

This handler will dump all the Environment variables and is purely for demonstrational purposes.

=head1 SYNOPSIS

 <?SPINE_SQLExport?>

=head1 VERSION

This is spine 1.2 beta.

=head1 AUTHOR

Hendrik Van Belleghem - b e a t n i k   a t   u s e r s  d o t  s f  d o t  n e t

=head1 LICENSE

SPINE is distributed under the GNU General Public License.

Read LICENSE for more information.

=head1 SEE ALSO

SPINE::*

Apache::SPINE::*

Apache::Request

Apache::Cookie

http://spine.sf.net

=cut
