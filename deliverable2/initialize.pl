#!/usr/bin/env perl

use strict;
use warnings;
use DBI;

my $schema_file = './database.sql';
open(my $fh, '<', $schema_file);

my $dbh;
$dbh = DBI->connect('DBI:mysql:host=localhost', 'root', 'notforyou2');
print $DBI::errstr unless defined $dbh;
$dbh->{PrintError} = 0;
$dbh->{RaiseError} = 1;  # errors cannot be silently ignored
$dbh->{AutoCommit} = 0;  # use transactions

my @schema = ();
{
  local $/ = ';';
  while (my $statement = <$fh>)
  {
    # FIXME: check for escaped semicolons
    # Check for blank statements (';' is a delimiter not a separator)
    if ($statement =~ /^\s*$/)
    {
      next;
    }
    push(@schema, $statement);
  }
}

for (@schema)
{
  my $sth = $dbh->prepare($_);
  $sth->execute;
}
$dbh->commit;
my $rc = $dbh->disconnect or warn $dbh->errstr;
exit $rc;
