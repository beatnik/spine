use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

use Getopt::Long;

my $just_modules = 1; # Only install modules
my $no_modules = 1; # Don't install modules
my $dbtype = "mysql"; # Default database type
my $dbname = "spine"; # Default database name
my $dbuser = "root"; # Default database user
my $dbpasswd = "secret"; # Default database password
my $apache = 0; # Default Apache version
my $mysql = 0; # Force using mysql
my $postgresql = 0; #Force using postgresql

my $argv = GetOptions ("no_modules"  => \$no_modules,
                        "just_modules" => \$just_modules,
                        "dbtype=s" => \$dbtype,
                        "dbname=s" => \$dbname,
                        "dbuser=s" => \$dbuser,
                        "dbpasswd=s" => \$dbpasswd,
                        "mysql" => \$mysql,
                        "postgresql" => \$postgresql,
                        "apache=i" => \$apache
                          ); 

if ($just_modules)
{ genmake(); exit; }

my $md5 = 0;
eval "use Digest::MD5"; $md5 = $@ ? 0 : 1;
print "Digest::MD5 found\n" if $md5;
die "Please install Digest::MD5!" if !$md5;

if (($apache == 1) or ($apache ==2))
{ print "Using Apache v$apache\n"; }
else
{ my $apache1 = 0;
  my $apache2 = 0;
  eval "use Apache::Constants"; $apache1 = $@ ? 0 : 1;
  eval "use Apache2::Const"; $apache2 = $@ ? 0 : 1;
  print "mod_perl 1 found\n" if $apache1;
  print "mod_perl 2 found\n" if $apache2;
  die "Please install mod_perl 1 or 2!" if !($apache1 || $apache2);

  my $apreq1 = 0;
  my $apreq2 = 0;
  eval "use Apache::Request"; $apreq1 = $@ ? 0 : 1;
  eval "use Apache2::Request"; $apreq2 = $@ ? 0 : 1;
  print "Apache::Request found\n" if $apreq1;
  print "Apache2::Request found\n" if $apreq2;
  die "Please install Apache::Request or Apache2::Request!" if !($apreq1 || $apreq2);
}


my $dbi = 0;
$dbtype = lc($dbtype);
if (($dbtype !~ /^mys/) && ($dbtype !~ /^pos/))
{ eval "use DBI"; $dbi = $@ ? 0 : 1;
  eval "use DBD::Pg"; $postgresql = $@ ? 0 : 1;
  eval "use DBD::mysql"; $mysql = $@ ? 0 : 1;
  print "DBI found\n" if $dbi;
  print "DBD::Pg found\n" if $postgresql;
  print "DBD::mysql found\n" if $mysql;
  die "Please install DBI!" if !$dbi;
  die "Please install DBD::Pg or DBD::mysql!" if !($mysql || $postgresql);
  $dbtype = $mysql ? "mysql" : "pg"; # Default database type
}

my $dberror = undef;
my $dbh = undef;

my $dbpass = 0;
while ($dbpass == 0)
{ if ($mysql && $pg)
  { $dbtype = prompt("You have MySQL and Postgresql installed. Enter mysql (default) or pg to select:","mysql");
    if (($dbtype ne "mysql") && ($dbtype ne "pg")) { next; }
  }
  $dbname = prompt("Enter the database name (defaultL spine):","spine") if !$dbname;
  $dbuser = prompt("Enter the database user:") if !$dbuser;
  $dbpasswd = prompt("Enter the database user password:") if !$dbpasswd;
  $dberror = undef;
  $dbh = undef;

  eval { $dbh = DBI->connect("dbi:$dbtype:dbname=$dbname","$dbuser","$dbpasswd", { PrintError => 0 } ); $dberror = $DBI::errstr; };
  if ($@ || !$dbh)
  { print "$dberror\n"; } else { $dbpass = 1; print "DBI connect succesfull\n"; }
}

if ($no_modules)
{ print "Skipping perl module installation\n";
  exit;
}

sub genmake
{ print "Generating makefile\n";
  WriteMakefile(
    'NAME'		=> 'Spine',
    'VERSION_FROM'	=> 'lib/SPINE/Constant.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.2
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (AUTHOR     => 'Hendrik Van Belleghem <beatnik@users.sourceforge.org>') : ()),
  );

  print "Run 'make install' as root to install\n";
}

