#!/usr/bin/perl

use Getopt::Long;
use DBI;
use SPINE::DBI::Content;
use SPINE::Base::Content;

my $dbuser = undef;
my $dbpasswd  = undef;
my $dbname = undef;
my $dbtype = "mysql";
my $style = "blank";
my $type = "text/html";
my $permissions ="1010";
my $owner = undef;
my $title = undef;
my $input = undef;
my $output = undef;
my $format = undef;

my $result= GetOptions ("dbuser=s"    => \$dbuser,
                     "dbpassword=s"   => \$dbpasswd,
                     "dbname=s"       => \$dbname,
                     "dbtype=s"       => \$dbtype,
                     "style=s"        => \$style,
                     "type=s"         => \$type,
                     "permissions=s"  => \$permissions,
                     "owner=s"        => \$owner,
                     "title=s"        => \$title,
                     "input=s"        => \$input,
		     "output=s"		  => \$output,
                     "format=s"       => \$format,
                    ); 

my $dbh = DBI->connect("dbi:$dbtype:dbname=$dbname","$dbuser","$dbpasswd") or die "Could not connect to Database:$!";
my $content_dbi = SPINE::DBI::Content->new($dbh);

if ($input)
{ my $content = shift @{$content_dbi->get({name=>$input})};
  if (!$content)
  { $content = SPINE::Base::Content->new;
    my $data = undef;
    open(FILE,"<$input") || die $!; 
    { local $/ = undef; $data = <FILE>; } 
    close(FILE);
    $content->name($input);
    $content->permissions($permissions) if $permissions;
    $content->type($type) if $type;
    $content->style($style) if $style;
    $content->body($data) if $data;
    $content->title($title) if $title;
    $content->owner($owner) if $owner;
    $content_dbi->add($content);
  } else
  { my $data = undef;
    open(FILE,"<$input") || die $!; 
    { local $/ = undef; $data = <FILE>; } 
    close(FILE);
    $content->name($input);
    $content->permissions($permissions) if $permissions;
    $content->type($type) if $type;
    $content->style($style) if $style;
    $content->body($data) if $data;
    $content->title($title) if $title;
    $content->owner($owner) if $owner;
    $content_dbi->update($content);
  }
}

if ($output)
{ my $content = shift @{$content_dbi->get({name=>$output})}; 
  if (!ref $content) { print "Oops"; }

 #Print the body
 open(FILE,">$output") || die $!;
 print FILE $content->body;
 close(FILE);
 #Dump the content to a hash
 my %hash = $content->tohash;
}
$dbh->disconnect();
