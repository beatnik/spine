package SPINE::Handler::Admin::Attr;

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

use strict;

use SPINE::DBI::Session;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::DBI::Adminaccess;
use SPINE::DBI::Content;
use SPINE::DBI::Attribute;
use SPINE::Base::Attribute;
use SPINE::Constant;

use Data::Dumper;

use SPINE::Transparent::Constant;

use vars qw($VERSION $content_dbi $user_dbi $usergroup_dbi $session_dbi $user $attribute_dbi $adminaccess_dbi $session_dbi $macro_dbi $request $user $adminaccess $adminaccess_dbi $request $error $readperms $writeperms $execperms);

$VERSION = $SPINE::Constant::VERSION;

#Apache::Request Handler
#DB Handler

sub handler 
{ $request = shift; #SPINE::Transparent::Request ; Apache::Request
  my $dbh = shift; #DB Handler
  my @params = ();
  SPINE::Transparent::Constant->new($request);
  my %cookies = $request->cookies;
  my $url = $request->uri;
  my $location = $request->location;

  $url =~ s/^$location\/?//mx;
  ($url,@params) = split("/",$url);

  $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  my $body = "";
  
  # This part catches the image as button bug in IE.
  my $action = $params[1];
  my $filename = $request->param('name');
  my $save = $request->param('save.x') ? "save" : "";
  my $delete = $request->param('delete.x') ? "delete" : "";    
  $action = $action || $save || $delete; 
  if ($request->method eq "POST" && $action eq "new")
  { newattr(); warn "Check #1"; }
  if ($request->method eq "POST" && $action eq "save")
  { saveattr(); }
  if ($request->method eq "POST" && $action eq "delete")
  { deleteattr(); }
  my $content = SPINE::Base::Content::default;
  $content->style("blank");
  my @attr = @{$attribute_dbi->get(section=>"content",name=>$filename)};
  my $attrlist = "";
  my $i = 0;
  for my $attr (@attr)
  { my %hash = $attr->tohash; 
    $attrlist .= <<"EOF";
<form name="attrform$i" action="<?SPINE_Location?>admin/attr/" method="post">
<input type="hidden" name="id" value="$hash{id}">
<input type="hidden" name="name" value="$hash{name}">
<input type="hidden" name="section" value="content">
<input type="text" class="input" name="attr" value="$hash{attr}" size="25">
<input type="text" class="input" name="value" value="$hash{value}" size="25">
<a onClick="makeRequest('POST','<?SPINE_Location?>admin/attr/save/', 'name=' + encodeURI( document.attrform$i.name.value )+'&section=' + encodeURI( document.attrform$i.section.value )+ '&attr=' + encodeURI( document.attrform$i.attr.value )+'&value=' + encodeURI( document.attrform$i.value.value )); return false;"><img border="0" src="/images/save.png" alt="Save" ></a>
<a onClick="makeRequest('POST','<?SPINE_Location?>admin/attr/delete/', 'id=' + encodeURI( document.attrform$i.id.value ) + '&name=' + encodeURI( document.attrform$i.name.value )); return false;"><img border="0" src="/images/delete.png" alt="Delete" ></a>
</form>\n
EOF

$i++;
    }

  $content->body($attrlist);
  return $content;
}

sub newattr
{ my $attr = SPINE::Base::Attribute->new();
  $attr->value(scalar $request->param('value'));
  $attr->attr(scalar $request->param('attr'));
  $attr->name(scalar $request->param('name'));
  $attr->section(scalar $request->param('section'));
  $attribute_dbi->add($attr);
  return;
}

sub saveattr
{ my $attr = $attribute_dbi->get({id => $request->param('id')});
  $attr->value($request->param('value')) if ref $attr;
  $attribute_dbi->update($attr) if $attr;
  return;
}

sub deleteattr
{ my $attr = $attribute_dbi->get({id => $request->param('id')});
  $attribute_dbi->remove($attr) if $attr;
  return;
}


1;
__END__

=pod

=head1 NAME

SPINE::Handler::Admin::Attr

=head1 DESCRIPTION

This is the Attribute Admin Handler for SPINE.

SPINE is a perl based content management system. This release uses mod_perl. It should, in time, support all features of the
CGI based version (but it will ofcourse add new things as well). This is a complete rewrite of the engine.

=head1 SYNOPSIS

Most of the installation process takes place in the Apache configuration file.

=head1 VERSION

This is spine 1.22.

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
