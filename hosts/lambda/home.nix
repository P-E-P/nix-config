{ config, pkgs, lib, ... }:

{

  home-manager.users.und = {

    xsession.windowManager.i3 = import programs/i3 { inherit pkgs lib; };

    home = {
      username = "und";
      homeDirectory = "/home/und";
      packages = with pkgs; [
        universal-ctags
        rustup
        cmake patchelf
        neofetch

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
        gtop

        feh
        gcc
        evince

        # Custom programs
        #tin
        steam

        discord
        # quartus-prime-lite
      ];
    };


    programs = import ./programs { inherit pkgs; };

    services = import ./services { inherit pkgs; };

  };
}
