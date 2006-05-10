package SPINE::Handler::Content;

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

use SPINE::DBI::Content;
use SPINE::DBI::Style;
use SPINE::DBI::User;
use SPINE::DBI::Usergroup;
use SPINE::Handler::Admin;
use SPINE::DBI::Session;
use SPINE::Constant;

use SPINE::Transparent::Constant;
use SPINE::Transparent::Request;

use Data::Dumper;

use strict;
use vars qw($VERSION);

$VERSION = $SPINE::Constant::VERSION;

sub handler 
{ my $request = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $s = shift; #Session
  my $tr_req = SPINE::Transparent::Request->new($request);
  SPINE::Transparent::Constant->new($request);
  my $main = $request->dir_config("main") || "main";
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $style_dbi = SPINE::DBI::Style->new($dbh);
  my $user_dbi = SPINE::DBI::User->new($dbh);
  my $usergroup_dbi = SPINE::DBI::Usergroup->new($dbh);
  my $session_dbi = SPINE::DBI::Session->new($dbh);
  my %cookies = $tr_req->cookies;
  my $login_info = shift @{$content_dbi->get({name=>".login", count=>1})}; 
  if (!ref $login_info) { $login_info = SPINE::Base::Content::default(); }
  my $username = undef;

  my @params = ();
  my $content = undef;
  my $status = undef;
  my $style = undef;
  my $url = $tr_req->request->uri;
  my $location = $tr_req->request->location;
  $url =~ s/^$location\/?//g;
  ($url,@params) = split("/",$url);
  if (!$url)
  { $url = $main; }
  if ($url eq 'admin')
  { ($content,$status) = SPINE::Handler::Admin::handler($request,$dbh);
    if (!ref $content)
    { $content = SPINE::Base::Content::default(body=>"Something is terribly wrong"); }
    if ($status ne $SPINE::Transparent::Constant::OK)
    { return $status; }
    my $_style = $content->style || ".admin";
    $style = shift @{$style_dbi->get({name=>$_style, count=>1})};
    if (!ref $style)
    { $content = SPINE::Base::Content::default(body=>"Something is terribly wrong");
    }
    if (!ref $content)
    { return $SPINE::Transparent::Constant::NOT_FOUND; }
  }
  else
  { $content = shift @{$content_dbi->get({name=>$url, count=>1})};
    if (!ref $content)
    { return $SPINE::Transparent::Constant::NOT_FOUND; }

    my $user = shift @{$user_dbi->get({login=>$content->owner})};
  
    my $page = $content;
    $content = shift @{$content_dbi->get({name=>$main, count=>1})} || SPINE::Base::Content::default(); 
    my $session = $session_dbi->get($cookies{'key'}->value) if $cookies{'key'};
    if (($session && !$session->username) || !$session)
    { $session = $s if ($s && $s->username); }
    if ($session && $session->host eq scalar($tr_req->remote_host()) && $session->username)
    { $login_info = shift @{$content_dbi->get({name=>".login_info", count=>1})} || SPINE::Base::Content::default(); }
    my $loadpage = 0;
    my $readwperms = $page->permissions & READWPERMISSIONS;
    $readwperms =~ s/0//g;
    $loadpage = $readwperms; 
    
    if ($session && $user && $session->username eq $user->login && $session->host eq scalar($tr_req->remote_host()) && !$loadpage)
    { my @usergroups =  @{ $usergroup_dbi->get({username=>$session->username}) };
      @usergroups = map { $_ = $_->usergroup } @usergroups;
      my $readgperms = $page->permissions & READGPERMISSIONS;
      $readgperms =~ s/0//g;
      $loadpage = 
      ($session->username eq 'admin') ||
      ($page->owner eq $session->username) ||
      (@usergroups && $readgperms);
    }
    $loadpage = 0 if $page->name =~ /^admin/;

    if ($loadpage)
    { $content = $page }
    else { return $SPINE::Transparent::Constant::FORBIDDEN; }

    $username = $session->username if $session;

    $style = shift @{$style_dbi->get({name=>$content->style, count=>1})} || SPINE::Base::Style::default(); 
  }

  my $body = $style->body if ref $style;
  while ($body =~ s/(<\?SPINE_(Macro[^\?]*)\?>)/process_handler($1,$2,$dbh,$request,$style)/ge) 
  { #
  }

  my $cbody = $content->body if ref $content;
  if (defined $cbody)
  { if ($content->breaks) { $cbody =~  s/\n/<BR>/g; }
    $body =~ s/<\?SPINE_Content\?>/$cbody/;
  }

  #$body =~ s/<\?SPINE_Content\("([^)]*)"\)\?>/
  #${$content_dbi->get({name=>$1})}[0]->body;
  #/ge; #TODO: This still needs to be fixed! Authorisation at this level... Perhaps add a flag for 'include only' content?!?

  my $title = undef;
  if (ref $style && $style->title) { $title = $style->title; } 
  if (ref $style && ref $content && $style->title && $content->title) { $title .= " - "; $title .= $content->title; }
  if (!$title && ref $content && $content->title) { $title = $content->title; }

  my $location = $request->location;
  if ($location !~ /\/$/) { $location .= "/"; }
  my $servername = $request->dir_config("servername") || $ENV{SERVER_NAME};
  
  $body =~ s/<\?SPINE_Title\?>/$title/g;

  $body =~ s/<\?SPINE_Webmaster\?>/$request->dir_config("webmaster")/ge;
  $body =~ s/<\?SPINE_Sitename\?>/$request->dir_config("sitename")/ge;
  $body =~ s/<\?SPINE_Referer\?>/$request->header_in("referer")/ge; #Undocumented Feature? Add to DOCS!!
  $body =~ s/<\?SPINE_Login\?>/$login_info->body/ge; #This will load either login on login_info
  $body =~ s/<\?SPINE_Page\?>/$url/g;
  $body =~ s/<\?SPINE_Servername\?>/$servername/g; 
  $body =~ s/<\?SPINE_Location\?>/$location/g; 
  $body =~ s/<\?SPINE_Logout\?>//g; #Backwards compatibility
  $body =~ s/<\?SPINE_User\?>/$username/g;  #Undocumented Feature? Add to DOCS!
#--
  $content->body($body);
  return $content;
#--  
}

# This is literally a copy from the index handler, but I need it for Macro ;)
sub process_handler #Ofcourse I could've done this pure inline, but I'm lazy
{ my $tag = shift; #This is the entire tag.. you never know if they might want to parse it themselves
  my $module = shift; #The module: SPINE_Foo -> SPINE::Handler::Foo
  my $dbh = shift; #Keep it threadsafe! Retrieve DB Handler from parameter
  my $req = shift; #Keep it threadsafe! Retrieve DB Handler from parameter
  my $content = shift; #Keep it threadsafe! Retrieve DB Handler from parameter
  $dbh = $dbh; #For some reason, removing this breaks stuff... so don't remove!!
  $req = $req; #For some reason, removing this breaks stuff... so don't remove!!
  $content = $content; #For some reason, removing this breaks stuff... so don't remove!!
  my $value = "";
  $module =~ s/^(\w*).*/$1/g; #Just make sure it's all aboot letters..
  return if !$module;
  return if !$tag;
  eval qq{
    use SPINE::Handler::$module;
    \$value = SPINE::Handler::${module}::handler(\$req,\$dbh,\$tag,\$content);  #Call the handler method in that uhm handler
  };
  warn $@ if $@; #Warn if necessary
  return $value;
}


1;
__END__

=pod

=head1 NAME

SPINE::Handler::Content

=head1 DESCRIPTION

This is the Content Handler for SPINE.

=head1 SYNOPSIS

  use SPINE::Handler::Content;

  my ($type,$body) = SPINE::Handler::Content::handler($req,$dbh,$session);
  $type ||= 'text/html';
  $req->content_type($type); #$req is an Apache::Request instance
  $req->send_http_header;
  return OK if $req->header_only;
  while ($body =~ s/(<\?SPINE_([^\?]*)\?>)/process_handler($1,$2)/ge) { }
  #I hope this doesn't come back to hunt me
  $req->print($body);
  return OK;

=head1 SYNTAX

SPINE::Handler::Content only has a handler method. The handler returns the content type and the content data.

=head1 VERSION

This is spine 1.1.

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
