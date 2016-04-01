{ stdenv, perl, perlPackages, qt55 }:

stdenv.mkDerivation rec {
  name = "twk";

  buildInputs = [
    perl perlPackages.DBI perlPackages.DBDmysql qt55.full qt55.qtcreator
  ];
}
