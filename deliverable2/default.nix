{ stdenv, fetchurl, buildPerlPackage, perl, perlPackages }:


let
  CGIApplication = buildPerlPackage rec {
    name = "CGI-Application-${version}";
    version = "4.50_50";
    src = fetchurl {
      url = "mirror://cpan/authors/id/M/MA/MARTO/${name}.tar.gz";
      sha256 = "0zz5ymyc41p7pfjlp1fs2l7csb4sqy6j0bka8fmixgdbrp7h3hk9";
    };

    buildInputs = with perlPackages; [
      ClassISA
      HTMLTemplate
    ];
  };
  RESTApplication = buildPerlPackage rec {
    name = "REST-Application-${version}";
    version = "0.992";
    src = fetchurl {
      url = "mirror://cpan/authors/id/M/MO/MOCONNOR/${name}.tar.gz";
      sha256 = "0da62w9abl60k5hymfsmw5dy755aw00z8kcnrbn2ywwrria7ckl4";
    };

    buildInputs = with perlPackages; [
      TieIxHash
    ];
  };
in
stdenv.mkDerivation rec {
  name = "twk";

  buildInputs = [
    perl perlPackages.DBI perlPackages.DBDmysql CGIApplication RESTApplication
  ];
}
