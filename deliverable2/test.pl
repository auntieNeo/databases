#!/usr/bin/env perl

use strict;
use warnings;
use DBI;

my $dbh;
$dbh = DBI->connect('DBI:mysql:database=twk;host=localhost', 'twk', 'notforyou2');
print $DBI::errstr unless defined $dbh;
$dbh->{PrintError} = 0;
$dbh->{RaiseError} = 1;  # errors cannot be silently ignored
$dbh->{AutoCommit} = 0;  # use transactions

sub add_vendor {
  my ($args) = @_;
  my $statement = 'INSERT INTO vendor (name, city, phone) VALUES (?, ?, ?)';
  my $sth = $dbh->prepare($statement);
  $sth->execute($args->{name}, $args->{city}, $args->{phone});
  $args->{dbh}->commit;
}

add_vendor({
  name => "Umbrella Corp.",
  city => "Raccoon City",
  phone => "555-2953",
  dbh => $dbh,
});
