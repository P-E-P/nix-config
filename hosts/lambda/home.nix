{ config, pkgs, lib, ... }:
{

  home-manager.users.und = {

    xsession.windowManager.i3 = import programs/i3 { inherit pkgs lib; };

    home = {
      username = "und";
      homeDirectory = "/home/und";
      packages = with pkgs; [
        rustup
        cmake patchelf

        docker-compose
        # Multimedia
        vlc obs-studio imagemagick
        inkscape
        # Networking
        wireguard nethogs sshfs
        # Misc
        minecraft flameshot
        firefox pavucontrol
        libnotify texlive.combined.scheme-full
        woof ripgrep
        zip unzip lz4 unrar
        gnupg

        # Fonts
        dejavu_fonts
        feh
      ];
    };


    programs = import ./programs { inherit pkgs; };

  };
}
