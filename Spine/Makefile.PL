use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

use Getopt::Long;

my $just_modules = 0; # Only install modules
my $no_modules = 0; # Don't install modules
my $dbtype = ""; # Default database type
my $dbname = ""; # Default database name
my $dbuser = ""; # Default database user
my $dbpasswd = ""; # Default database password
my $apache = 0; # Default Apache version
my $mysql = 0; # Force using mysql
my $postgresql = 0; #Force using postgresql
my $location = "/spine"; # Default location for Apache configuration
my $copy = 0;
my $adminpassword = "";
my $sitename = "";
my $chroot = "";  # Blank value means $DOCUMENT_ROOT
my $help = 0;
my $configfile = "";

my $argv = GetOptions ("no_modules"  => \$no_modules,
                        "just_modules" => \$just_modules,
                        "dbtype=s" => \$dbtype,
                        "dbname=s" => \$dbname,
                        "dbuser=s" => \$dbuser,
                        "dbpasswd=s" => \$dbpasswd,
                        "mysql" => \$mysql,
                        "postgresql" => \$postgresql,
                        "apache=i" => \$apache,
                        "sitename=s" => \$sitename,
                        "chroot=s" => \$chroot,
                        "adminpassword=s" => \$adminpasword,
                        'help|?' => \$help,
                          ); 

if ($help)
{ print <<EOF;
The following options can be used to force a setting:
--no_modules\t\tskip perl library installation
--just_modules\t\tjust install perl libraries
--dbtype=string\t\tuse database type. Valid options: postgresql or mysql
--dbname=string\t\tdatabase name
--dbuser=string\t\tusername for the databse
--dbpasswd=string\tpassword for the database
--mysql\t\t\tuse mysql as database
--postgresql\t\tuse postgresql as database
--apache=version\tuse a specific apache version. Valid versions: 1 or 2
--sitename=name\t\tpredefine the sitename
--location=web path\tpath in the URL. Example: /spine  in http://www.yoursite.com/spine
--chroot=document_root\tlocation of Document Root
--adminpassword=password\t\tGenerate Administrator user account SQL statement with following password
--help\t\t\tdisplay this message
EOF
  exit;
}

if ($just_modules)
{ genmake(); exit; }

my $md5 = 0;
eval "use Digest::MD5"; $md5 = $@ ? 0 : 1;
print "Digest::MD5 found\n" if $md5;
die "Please install Digest::MD5!" if !$md5;

eval "use File::Copy"; $copy = $@ ? 0 : 1;
print "File::Copy found\n" if $copy;
print "File::Copy not found." if !$copy;

my $apache1 = 0;
my $apache2 = 0;
my $apache = 0;

if (($apache == 1) or ($apache == 2))
{ print "Using Apache v$apache\n";
  $apache1 = $apache == 1 ? 1 : ($apache2 = 1);
}
else
{ eval "use Apache::Constants"; $apache1 = $@ ? 0 : 1;
  eval "use Apache2::Const"; $apache2 = $@ ? 0 : 1;
  print "Apache 1 + mod_perl 1 found\n" if $apache1;
  print "Apache 2 + mod_perl 2 found\n" if $apache2;
  die "Please install mod_perl v1 or v2" if !$apache1 && !$apache2;
  $apache = $apache1 ? 1 : 2;
  my $apreq1 = 0;
  my $apreq2 = 0;
  eval "use Apache::Request"; $apreq1 = $@ ? 0 : 1;
  eval "use Apache2::Request"; $apreq2 = $@ ? 0 : 1;
  print "Apache::Request found\n" if $apreq1;
  print "Apache2::Request found\n" if $apreq2;
  die "Please install Apache::Request or Apache2::Request!" if !($apreq1 || $apreq2);
}

my $configdb = prompt("Configure database?","yes");
if ($configdb !~ /yes/i)
{ goto NODB; }

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
  { $dbtype = prompt("You have MySQL or PostgreSQL installed. Enter mysql (default) or pg to select:","mysql");
    if (($dbtype ne "mysql") && ($dbtype ne "pg")) { next; }
  }

  $dbname = prompt("Enter the database name (default spine):","spine") if !$dbname;
  $dbuser = prompt("Enter the database user:") if !$dbuser;
  $dbpasswd = prompt("Enter the database user password:") if !$dbpasswd;
  $dberror = undef;
  $dbh = undef;

  eval { $dbh = DBI->connect("dbi:$dbtype:dbname=$dbname","$dbuser","$dbpasswd", { PrintError => 0 } ); $dberror = $DBI::errstr; };
  if ($@ || !$dbh)
  { print "$dberror\n"; } else
  { $dbpass = 1;
    print "DBI connect succesfull\n";
    my $sth = $dbh->prepare("select title from content where name = 'index.html'");
    if ($dbh->errstr)
    { print "Database exists but does not contain SQL schema."; }
    else
    { $sth->execute();
      if ($sth->fetchrow_array)
      { print "Database already contains content. Use SQL import data from upgrade folder\n"; }
      else { print "Database exists but does not contain content. Use SQL import from install folder\n"; }
    }
  }
  if (!$dbpass)
  { my $force = prompt("Cannot connect to $dbtype database $dbname. Continue anyway?","yes");
    $dbpass = 1 if $force =~ /y/i;
  }
}

my $createadmin = prompt("Generate SQL statement for site administrator account?","yes");
if ($createadmin =~ /y/i)
{ while (!$adminpassword)
  { $adminpassword = prompt("Enter password you want to assign to user 'admin' in Spine:");  }
  my $dig = Digest::MD5->new;
  $dig->add($adminpassword);
  my $md5password = $dig->hexdigest;
  print "The generated SQL below needs to be pasted into the database shell.\n";
  print qq{insert into users (email,fullname,login,password,usergroup) values ('admin\@localhost','Administrator','admin','$md5password','admin');\n};
}

NODB:

$apache = $apache1 ? "" : $apache;
$configfile = $apache1+$apache2 == 2 ? "apache-conf.incl & apache2-conf.incl" : "apache$apache-conf.incl";

print "Default configuration for Apache is found is $configfile\n";
my $configapache = prompt("Generate configuration file for Apache?","yes");
if ($configapache !~ /yes/i)
{ goto NOHTTP; }

$sitename = prompt("Enter sitename:", $sitename);
$sitename ||= "_";
$docroot ||= "Default Apache Document Root";
$docroot = prompt("Enter document root:", $docroot);
$docroot = $docroot eq "Default Apache Document Root" ? "DOCROOT" : $docroot;

my $stdout = \*STDOUT;
my $handler = \*STDOUT;

if ($apache1 + $apache2 == 2)
{ genconfig($handler, 1, "PerlHandler Apache::SPINE::Index", "PerlLogHandler Apache::SPINE::Log");
  genconfig($handler, 2, "PerlResponseHandler Apache2::SPINE::Index", "PerlLogHandler Apache2::SPINE::Log");
  my $write = prompt("Write configuration to file?","yes");
  if ($write =~ /yes/i)
  { open(CONFIG,">apache-conf.incl") || die $!;
    genconfig(\*CONFIG, 1, "PerlHandler Apache::SPINE::Index", "PerlLogHandler Apache::SPINE::Log");
    close(CONFIG);
    print "Configuration written in apache-conf.incl\n";
    open(CONFIG,">apache2-conf.incl") || die $!;
    genconfig(\*CONFIG, 2, "PerlResponseHandler Apache2::SPINE::Index", "PerlLogHandler Apache2::SPINE::Log");
    close(CONFIG);
    print "Configuration written in apache2-conf.incl\n";    
  }
}
else
{ my $perlhandler = "PerlHandler Apache::SPINE::Index";
  my $loghandler = "PerlLogHandler Apache::SPINE::Log";
  my $version = 1;
  $perlhandler = $apache1 ? "PerlHandler Apache::SPINE::Index" : "PerlResponseHandler Apache2::SPINE::Index";
  $loghandler = $apache1 ? "PerlLogHandler Apache::SPINE::Log" : "PerlLogHandler Apache2::SPINE::Log";
  $version = $apache2 ? 2 : $version;
  genconfig($handler, $version, $perlhandler, $loghandler);
  my $write = prompt("Write configuration to file?","yes");
  if ($write =~ /yes/i)
  { open(CONFIG,">apache$apache-conf.incl") || die $!;
    genconfig(\*CONFIG, 2, "PerlResponseHandler Apache2::SPINE::Index", "PerlLogHandler Apache2::SPINE::Log");
    close(CONFIG);
    print "Configuration written in apache$apache-conf.incl\n";
  }
}

NOHTTP:

if ($no_modules)
{ print "Skipping perl module installation\n";
  exit;
}

if ($copy)
{ my $copyimages = prompt("Copy images automatically to images folder?","yes");
  if ($copyimages =~ /yes/i)
  { my $imagesfolder = prompt("Define the images folder");
    opendir(IMAGES,"images") || die $!;
    for my $img (readdir(IMAGES))
    { next if $img =~ /^\.{1,2}$/;
      next if -d "images/$img";
      copy( "images/$img", "$imagesfolder/$img" ) or die "Copy failed: $!";
      print "Copied $img to $imagesfolder/$img\n";
    }
  }
}

genmake();

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

sub genconfig
{ my $outhandler = shift;
  my $version = shift;
  my $perlhandler = shift;
  my $loghandler = shift;
print $outhandler <<EOF;
-- Copy this to the Apache $version configuration file

<IfModule mod_perl.c>
 # PerlModule Apache::DBI
 # Remove the # above if you have Apache::DBI installed and you wish to use it

  <Location $location>
           SetHandler perl-script
           $perlhandler
           PerlSetVar dbd $dbtype
           PerlSetVar dbname $dbname
           PerlSetVar dbuser $dbuser
           PerlSetVar dbpwd $dbpasswd
           PerlSetVar main index.html
           PerlSetVar webmaster 'John Doe'
	   #perlSetVar servername 'servername:8080' 
           PerlSetVar sitename $sitename 
           PerlSetVar chroot $docroot
           $loghandler
  </Location>

</IfModule>

-- Configuration ends here
EOF
   
select(\*$stdout); 
}
