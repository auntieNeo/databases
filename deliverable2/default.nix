{ stdenv, perl, perlPackages }:

stdenv.mkDerivation rec {
  name = "twk";

  buildInputs = [
    perl perlPackages.DBI perlPackages.DBDmysql
  ];
}
