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

sub add_customer {
  my ($args) = @_;
  my $statement = 'INSERT INTO customer (fname, lname, email, phone, address) VALUES (?, ?, ?, ?, ?)';
  my $sth = $dbh->prepare($statement);
  $sth->execute(
    $args->{fname},
    $args->{lname},
    $args->{email},
    $args->{phone},
    $args->{address}
  );
  $args->{dbh}->commit;
}

sub add_vendor {
  my ($args) = @_;
  my $statement = 'INSERT INTO vendor (name, city, phone) VALUES (?, ?, ?)';
  my $sth = $dbh->prepare($statement);
  $sth->execute($args->{name}, $args->{city}, $args->{phone});
  $args->{dbh}->commit;
}

add_vendor({
  name => 'Umbrella Corp.',
  city => 'Raccoon City',
  phone => '555-2953',
  dbh => $dbh,
});

add_customer({
  fname => 'John',
  lname => 'Doe',
  email => 'johndoe@example.com',
  phone => '555-1973',
  address => "8463 12th Street East\nDearborn, MI 48124",
  dbh => $dbh
});
