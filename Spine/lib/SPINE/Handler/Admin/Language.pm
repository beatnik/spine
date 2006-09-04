package SPINE::Handler::Admin::Language;

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

## $Author: beatnik $ - $Date: 2006/03/08 20:48:44 $ - $Revision: 1.18 $

use warnings;
use strict;

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Macro;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::DBI::Attribute;
use SPINE::Constant;

use Data::Dumper;

use SPINE::Transparent::Constant;
use SPINE::Transparent::Request;

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $attribute_dbi $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  my $th_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my %cookies = $th_req->cookies;
  my $url = $request->uri;
  my $location = $request->location;
  
  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);

  # This part catches the image as button bug in IE.
  my $save = $request->param('save.x') ? "save" : "";
  my $delete = $request->param('delete.x') ? "delete" : "";    
  my $action = $save || $delete; 
  if ($request->method eq "POST" && $action eq "save")
  { savelanguage(); }
  if ($request->method eq "POST" && $action eq "delete")
  { deletebutton(); }

  my @attributes = @{ $attribute_dbi->get( {section=>"i18n", attr => "en" }) };
  my $body = "";
  for(@attributes)
  { my %hash = $_->tohash; 
  $body .= <<EOF;
<form action="<?SPINE_Location?>admin/language/" method="post">
<input type="hidden" name="id" value="$hash{id}">
<input type="hidden" name="attr" value="$hash{attr}">
<input type="text" class="input" name="name" value="$hash{name}">
<input type="text" class="input" name="value" value="$hash{value}" size="60">
<input type="image" name="save" src="/images/save.png">
<input type="image" name="delete" src="/images/delete.png">
</form>\n

EOF

}
  my $content = SPINE::Base::Content::default;
  $content->style(".admin_plugin");
  $content->body($body);
  return $content;
}

sub savelanguage
{ my $language = $attribute_dbi->get({id => $request->param('id')});
  $language->value($request->param('value')) if ref $language;
  $attribute_dbi->update($language) if $language;
  return;
}

sub deletelanguage
{ my $language = $attribute_dbi->get({id => $request->param('id')});
  $attribute_dbi->remove($language) if $language;
  return;
}


1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Adminaccess

=head1 DESCRIPTION

This is the Admin Access Control Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

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
