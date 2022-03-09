{ pkgs, lib, ... }:

let
  wallpaper = builtins.fetchurl {
    url = https://wallpapers.etherealgames.com/wp-content/uploads/sites/6/2018/04/Doom-Wallpaper-003.jpg;
    sha256 = "1f207kh8c02xv4c03bylkxyw2ppcs3ns9dzc5hwfdqhrp53ij922";
  };
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
in
  {
    enable = true;
    package = pkgs.i3;

    config = rec {
      modifier = "Mod4";
      terminal = "alacritty";

      window.border = 1;

      keybindings = lib.mkOptionDefault {
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
        "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
        "${modifier}+Print" = "exec --no-startup-id ${pkgs.flameshot}/bin/flameshot full -c -p \"/home/und/Pictures/Screenshots\"";
        "${modifier}+Shift+Print" = "exec --no-startup-id ${pkgs.flameshot}/bin/flameshot gui";

        # Workspace management
        "${modifier}+1" = "workspace ${cfg.workspaces.ws1}";
        "${modifier}+2" = "workspace ${cfg.workspaces.ws2}";
        "${modifier}+3" = "workspace ${cfg.workspaces.ws3}";
        "${modifier}+4" = "workspace ${cfg.workspaces.ws4}";
        "${modifier}+5" = "workspace ${cfg.workspaces.ws5}";
        "${modifier}+6" = "workspace ${cfg.workspaces.ws6}";
        "${modifier}+7" = "workspace ${cfg.workspaces.ws7}";
        "${modifier}+8" = "workspace ${cfg.workspaces.ws8}";
        "${modifier}+9" = "workspace ${cfg.workspaces.ws9}";
        "${modifier}+0" = "workspace ${cfg.workspaces.ws10}";
        "${modifier}+Shift+1" = "move container to workspace ${cfg.workspaces.ws1}";
        "${modifier}+Shift+2" = "move container to workspace ${cfg.workspaces.ws2}";
        "${modifier}+Shift+3" = "move container to workspace ${cfg.workspaces.ws3}";
        "${modifier}+Shift+4" = "move container to workspace ${cfg.workspaces.ws4}";
        "${modifier}+Shift+5" = "move container to workspace ${cfg.workspaces.ws5}";
        "${modifier}+Shift+6" = "move container to workspace ${cfg.workspaces.ws6}";
        "${modifier}+Shift+7" = "move container to workspace ${cfg.workspaces.ws7}";
        "${modifier}+Shift+8" = "move container to workspace ${cfg.workspaces.ws8}";
        "${modifier}+Shift+9" = "move container to workspace ${cfg.workspaces.ws9}";
        "${modifier}+Shift+0" = "move container to workspace ${cfg.workspaces.ws10}";

        # Function keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ false, exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ false, exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%+";
        "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";
      };

      modes = {
        resize = {
          Down = "resize grow height 10 px or 10 ppt";
          Escape = "mode default";
          Left = "resize shrink width 10 px or 10 ppt";
          Return = "mode default";
          Right = "resize grow width 10 px or 10 ppt";
          Up = "resize shrink height 10 px or 10 ppt";
          ShiftUp = "resize shrink height 2 px or 2 ppt";
          ShiftDown = "resize grow height 2 px or 2 ppt";
          ShiftLeft = "resize shrink width 2 px or 2 ppt";
          ShiftRight = "resize grow width 2 px or 2 ppt";
        };
      };

      window.commands = [
        { command = "border pixel 0"; criteria = { class = "Firefox"; }; }
        { command = "border pixel 0"; criteria = { class = "discord"; }; }
      ];

      assigns = {
        "${cfg.workspaces.ws10}" = [ { class = "discord"; } ];
      };

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
          always = true;
          notification = false;
        }
      ];
    };
  }
