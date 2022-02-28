{ pkgs, ... }:

{
  home-manager.enable = true;
  command-not-found.enable = true;

  vim = import ./vim { inherit pkgs; };

  git = import ./git.nix {};

  bash = import ./bash {};

  alacritty = import ./alacritty.nix {};

  rofi = import ./rofi { inherit pkgs; };

  fzf = {
    enable = true;

    enableBashIntegration = true;
  };

  ncmpcpp = import ./ncmpcpp.nix {};

}
