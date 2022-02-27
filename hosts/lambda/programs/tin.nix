{ stdenv, pkgs, ... }:

stdenv.mkDerivation {
  name = "tin";
  version = "1.0.0";

  src = builtins.fetchGit {
    url = "https://salsa.debian.org/md/tin.git";
    rev = "3fda9fb9a021c1c3ad3b83b1d6d83314a85fdcb3";
  };

  buildInputs = with pkgs; [ ncurses libidn dante gnupg icu ispell perl ];
  nativeBuildInputs = with pkgs; [ autoconf automake bison ];

  output = [ "man" ];

}
