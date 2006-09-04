package SPINE::Handler::Message;

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

#Request Handler
#DB Handler

use warnings;

use SPINE::Base::Message;
use SPINE::DBI::Content;
use SPINE::DBI::Message;
use SPINE::DBI::Messagegroup;
use SPINE::DBI::Attribute;
use SPINE::Constant;

use Data::Dumper;
use Time::Local;

use strict;

use vars qw(@days @months $VERSION $error);

$VERSION = $SPINE::Constant::VERSION;
@days = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);
@months = qw(January February March April May June July August September October November December);

sub handler 
{ my $r = shift; #Apache::Request
  my $dbh = shift; #DB Handler
  my $tag = shift;
  my ($params) = $tag =~ m,\(([^\)]*)\),g;
  my @params = split(/,/,$params);
  my $message_dbi = SPINE::DBI::Message->new($dbh);
  my $messagegroup_dbi = SPINE::DBI::Messagegroup->new($dbh);
  my $content_dbi = SPINE::DBI::Content->new($dbh);
  my $attribute_dbi = SPINE::DBI::Attribute->new($dbh);
  my $message = undef;
  my $group = shift @params;
  my $url = $r->uri;
  my $location = $r->location;
  $error = '';
  
  $url =~ s/^$location\/?//;

  my $id = shift @params;
  ($id) = $id =~ /\"?([^\"]*)\"?/;

  my $subject = shift @params;
  ($subject) = $subject =~ /\"?([^\"]*)\"?/;

  ($url,@params) = split("/",$url);

  ($group) = $group =~ /\"?([^\"]*)\"?/;
  #Message group is the first parameter
  my $messagegroup = shift @{ $messagegroup_dbi->get({name=>$group, count=>1}) } ; 
  my $content = shift @ { $content_dbi->get({name=>$messagegroup->content, count=>1}) };
  if (!ref $content)
  { $content = shift @{$content_dbi->get({name=>".404", count=>1})} || SPINE::Base::Content::default(); 
    my $body = $content->body;
    $body =~ s/\$page/$url/g;
    my ($serversig) = $ENV{SERVER_SOFTWARE} =~ /^(.*?)\s.*/;
    $serversig .= " Server at $ENV{SERVER_NAME} Port $ENV{SERVER_PORT}";
    $body =~ s/\$serversig/$serversig/g;
    $content->body($body);
  }  
  my $tbody = $content->body;
  my $body = undef;
  #The message ID is the second parameter.
  my $parent = $r->param('parent') || 0;
  my $limit = $r->param('limit');
  ($limit) = $limit =~ /^(\d*)$/;
  my $offset = $r->param('offset');
  my ($order_hash) = shift @{$attribute_dbi->get(section=>"message",attr=>"order",name=>"$group")};
  my %order_hash = ();
  %order_hash = %{ $order_hash} if $order_hash;
  ($offset) = $offset =~ /^(\d*)$/;  
  #Ugh.. I really need to comment this code
  my @narrow = ();
  push(@narrow,"mgroup", $group) if $group ne '';
  push(@narrow,"parent", $parent) if $parent ne '';
  push(@narrow,"subject",$subject) if $subject ne '';
  push(@narrow,"limit",$limit) if $limit ne '';
  push(@narrow,"offset",$offset) if $offset ne '';
  push(@narrow,"sort","mdate $order_hash{VALUE}") if $order_hash{VALUE};
  my @messages = ();
  if (!$id && !$group) { return ""; }
  if (!$id) { $id = $r->param('id'); }
  if ($id && $group)
  { @narrow = ();
    push(@narrow,"limit",$limit) if $limit ne '';
    push(@narrow,"offset",$offset) if $offset ne ''; 
    @messages = @ { $message_dbi->get( { "id"=>$id, "mgroup"=>$group, @narrow } ) }; }
  else 
  { @messages = @{ $message_dbi->get(@narrow) } ; }
  for my $message (@messages)
  { next if ref($message) ne "SPINE::Base::Message";
    my $mbody = $tbody;
    my $date = $message->mdate; #First date eh??
    my ($year,$month,$day,$hour,$minute,$second) = $date =~ /^(\d{4})\-(\d{2})\-(\d{2}) (\d{2})\:(\d{2})\:(\d{2})$/;
    $month--;
    my $id = $message->id;
    my @comments = ();
    @comments = @{ $message_dbi->get({ mgroup=>$group, parent=>$id }) } if $id;
    my $time = timelocal($second,$minute,$hour,$day,$month,$year);
    my $wday = (localtime($time))[6];
    my $parent = shift @ { $message_dbi->get( { "id"=>$message->parent, "mgroup"=>$group, count=>1} ) };
    my $parent_subject = undef;
    $parent_subject = $parent->subject if $parent;
    my $datetime = "$days[$wday] $months[$month] $day, $year ($hour:$minute:$second)";
    $date = "$days[$wday] $months[$month] $day $year";
    $time = "$hour:$minute:$second";
    $mbody =~ s/<\?SPINE_Message_Body\?>/$message->body/ge;
    $mbody =~ s/<\?SPINE_Message_Subject\?>/$message->subject/ge;
    $mbody =~ s/<\?SPINE_Message_Date\?>/$date/g;
    $mbody =~ s/<\?SPINE_Message_Time\?>/$time/g;
    $mbody =~ s/<\?SPINE_Message_DateTime\?>/$datetime/g;
    $mbody =~ s/<\?SPINE_Message_Owner\?>/$message->owner/ge;
    $mbody =~ s/<\?SPINE_Message_Id\?>/$message->id/ge;
    $mbody =~ s/<\?SPINE_Page\?>/$url/ge;
    $mbody =~ s/<\?SPINE_Message_Parent_Id\?>/$message->parent/ge;
    $mbody =~ s/<\?SPINE_Message_Parent_Subject\?>/$parent_subject/g;
    $mbody =~ s/<\?SPINE_Message_Group\?>/$group/ge;
    $mbody =~ s/<\?SPINE_Message_Comments\?>/scalar(@comments)/ge;
    $body .= $mbody;
  }
  return $body;
}

1;
__END__

=pod

=head1 NAME

SPINE::Handler::Message

=head1 DESCRIPTION

This is the Message Handler for SPINE.

This handler will show messages.

=head1 SYNOPSIS

Pass the message group and the message ID as the parameters. If you do not pass the message ID, the handler will show all the messages in that group in that specific parent level.
By default, messages have parent level 0. This means that they are messages in the root node. Each message can have several other messages attached to them. These messages can be viewed by passing the parent message ID as an URL parameter.

 <?SPINE_Message("test","1")?>

Use

  <?SPINE_Message("test")?>

to show all messages in the root parent level. If you call that page with parameter :

 message.html?parent=5

then all messages with parent message 5 are shown.
Each message group can have a specific content defined. In that content, certain tags are used to replace the message body, author, date and subject.

 <?SPINE_Message_Body?>

This tag is used for the message body.

 <?SPINE_Message_Subject?>

This tag is used for the message subject.

 <?SPINE_Message_Date?>

This tag is used for the message date.

 <?SPINE_Message_Owner?>

This tag is used for the message author.

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
