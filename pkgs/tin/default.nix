{ stdenv, pkgs, ... }:

stdenv.mkDerivation rec {
  name = "tin";
  version = "1.0.0";

  src = builtins.fetchurl {
    url = "ftp://ftp.tin.org/pub/news/clients/tin/stable/tin-current.tar.gz";
    sha256 = "1dc3bb9fymqlj7br8j14n2zf2fck733s2if8vg47nih7mg4ch6vb";
  };

  buildInputs = with pkgs; [ ncurses libidn dante gnupg icu ispell perl ];
  nativeBuildInputs = with pkgs; [ autoconf automake bison ];

  output = [ "man" ];

}
