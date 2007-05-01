#!/usr/bin/perl

use DBI;

#$table = $ARGV[0];

my $dbh = DBI->connect("dbi:mysql:$ARGV[0]","beatnik","foobar") || die "Can't connect to DB: ".$Mysql::db_errstr;

for $table (qw(attribute adminaccess content macro message messagegroup navbarbuttons navbars style usergroup users) )
{ $sth = $dbh->prepare("select * from $table") || die "Oops"; 
  $sth->execute(); 
  print "\n\n--\n-- mysql v3 dump for SPINE 1.22 : Table $table\n--\n\n";
  while($ref = $sth->fetchrow_hashref())
  { %hash = %{ $ref };
    print "insert into $table (";
    delete($hash{id}) if $table ne "navbars";
    my @keys = sort keys %hash;
    while ($_ = shift(@keys))
    { print $_;
      print "," if @keys;
    }
    print ") values (";
    delete($hash{id}) if $table ne "navbars";
    @keys = sort keys %hash;
    while($_ = shift(@keys))
    { $f = $hash{$_};
      $f =~ s/\"/\\\"/g;
      $f =~ s/\'/\\\'/g;
      $f =~ s/\n/\\n/g;
      $f =~ s/\r/\\r/g;
      print qq('$f');
      print "," if @keys;
    }
    print ");\n";
  }
  $sth->finish;
}
$dbh->disconnect;
