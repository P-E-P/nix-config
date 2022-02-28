{ config, pkgs, lib, ... }:
# TODO:
# Find a way to refactor common bits
{

  home-manager.users.und = {

    xsession.windowManager.i3 = import programs/i3 { inherit pkgs lib; };

    home = {
      username = "und";
      homeDirectory = "/home/und";
      packages = builtins.attrValues {
        inherit(pkgs)
        universal-ctags
        rustup
        cmake patchelf
        arandr

        docker-compose
        # Multimedia
        imagemagick
        inkscape
        # Networking
        wireguard nethogs sshfs
        # Misc
        flameshot
        firefox pavucontrol
        libnotify
        #texlive
        ripgrep
        zip unzip lz4 unrar
        gnupg

        # Fonts
        dejavu_fonts
        feh

        # Custom programs
        discord
        ;
        inherit(pkgs.packages)
        tin
        ;
      };
    };


    programs = import ./programs { inherit pkgs; };

  };
}
