{ config, pkgs, lib, ... }:

{

  home-manager.users.und = {

    home = {
      username = "und";
      homeDirectory = "/home/und";
      packages = builtins.attrValues {
        inherit (pkgs)
        neofetch
        helix
        nil
        wayland
        alacritty
        qpwgraph
        wdisplays
        pavucontrol
        xdg-desktop-portal-wlr
        xdg-desktop-portal
        grim

        # Multimedia
        vlc obs-studio imagemagick
        inkscape
        # Networking
        wireguard-tools
        # Misc
        flameshot
        firefox
        libnotify
        woof ripgrep
        zip unzip lz4 unrar
        gnupg
        gtop
        wofi

        gcc
        rustup
        evince

        # Custom programs
        #tin
        discord
        ;
        inherit (pkgs.texlive.combined)
        scheme-full
        ;
      };
    };


    programs = import ./programs { inherit pkgs; };

    wayland.windowManager.sway = {
      enable = true;

      wrapperFeatures = {
        base = true;
        gtk = true;
      };

      config = rec {
        modifier = "Mod4";
        terminal = "alacritty";

        gaps = {
          inner = 5;
          outer = 5;
          smartGaps = true;
          smartBorders = "on";
        };

        assigns = {
          "2" = [{ class = "Firefox"; }];
          "10" = [{ class = "discord"; }];
        };

        bars = [{ command = "${pkgs.waybar}/bin/waybar"; }];

        keybindings = let
          cfg = {
            workspaces = {
              ws1 = "1";
              ws2 = "2";
              ws3 = "3";
              ws4 = "4";
              ws5 = "5";
              ws6 = "6";
              ws7 = "7";
              ws8 = "8";
              ws9 = "9";
              ws10 = "10";
            };
          };
        in {
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+Shift+q" = "kill";
          "${modifier}+d" = "exec ${pkgs.wofi}/bin/wofi --show=drun";
          "${modifier}+Shift+d" = "exec ${pkgs.wofi}/bin/wofi --show=window";

          "${modifier}+Print" = "exec --no-startup-id ${pkgs.flameshot}/bin/flameshot full -c -p \"/home/und/Pictures/Screenshots\"";
          "${modifier}+Shift+Print" = "exec --no-startup-id ${pkgs.flameshot}/bin/flameshot gui";

          "${modifier}+Left" = "focus left";
          "${modifier}+Down" = "focus down";
          "${modifier}+Up" = "focus up";
          "${modifier}+Right" = "focus right";

          "${modifier}+Shift+Left" = "move left";
          "${modifier}+Shift+Down" = "move down";
          "${modifier}+Shift+Up" = "move up";
          "${modifier}+Shift+Right" = "move right";

          "${modifier}+b" = "splith";
          "${modifier}+v" = "splitv";
          "${modifier}+f" = "fullscreen toggle";
          "${modifier}+a" = "focus parent";

          "${modifier}+s" = "layout stacking";
          "${modifier}+w" = "layout tabbed";
          "${modifier}+e" = "layout toggle split";

          "${modifier}+Shift+space" = "floating toggle";
          "${modifier}+space" = "focus mode_toggle";

          "${modifier}+Shift+r" = "reload";
          "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";

          "${modifier}+r" = "mode resize";


          "${modifier}+ampersand" = "workspace ${cfg.workspaces.ws1}";
          "${modifier}+eacute" = "workspace ${cfg.workspaces.ws2}";
          "${modifier}+quotedbl" = "workspace ${cfg.workspaces.ws3}";
          "${modifier}+apostrophe" = "workspace ${cfg.workspaces.ws4}";
          "${modifier}+parenleft" = "workspace ${cfg.workspaces.ws5}";
          "${modifier}+minus" = "workspace ${cfg.workspaces.ws6}";
          "${modifier}+egrave" = "workspace ${cfg.workspaces.ws7}";
          "${modifier}+underscore" = "workspace ${cfg.workspaces.ws8}";
          "${modifier}+ccedilla" = "workspace ${cfg.workspaces.ws9}";
          "${modifier}+agrave" = "workspace ${cfg.workspaces.ws10}";

          "${modifier}+Shift+ampersand" = "move container to workspace ${cfg.workspaces.ws1}";
          "${modifier}+Shift+eacute" = "move container to workspace ${cfg.workspaces.ws2}";
          "${modifier}+Shift+quotedbl" = "move container to workspace ${cfg.workspaces.ws3}";
          "${modifier}+Shift+apostrophe" = "move container to workspace ${cfg.workspaces.ws4}";
          "${modifier}+Shift+parenleft" = "move container to workspace ${cfg.workspaces.ws5}";
          "${modifier}+Shift+minus" = "move container to workspace ${cfg.workspaces.ws6}";
          "${modifier}+Shift+egrave" = "move container to workspace ${cfg.workspaces.ws7}";
          "${modifier}+Shift+underscore" = "move container to workspace ${cfg.workspaces.ws8}";
          "${modifier}+Shift+ccedilla" = "move container to workspace ${cfg.workspaces.ws9}";
          "${modifier}+Shift+agrave" = "move container to workspace ${cfg.workspaces.ws10}";

          "${modifier}+Shift+parenright" = "move scratchpad";
          "${modifier}+parenright" = "scratchpad show";

          "XF86MonBrightnessDown" = "exec ${pkgs.light}/bin/light -U 3";
          "XF86MonBrightnessUp" = "exec ${pkgs.light}/bin/light -A 3";
        };


        input = {
          "2821:6246:Asus_Keyboard" = {
            xkb_layout = "fr";
          };
        };

      };

      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export _JAVA_AWT_WM_NONREPARENTING=1
        export QT_QPA_PLATFORM=wayland
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_DESKTOP=sway
        export MOZ_ENABLE_WAYLAND=1
      '';
    };

    services = import ./services { inherit pkgs; };

  };
}
