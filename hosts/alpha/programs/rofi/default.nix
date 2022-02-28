{ pkgs, ... }:

{
  enable = true;

  theme = ./clouds.rasi;

  package = pkgs.rofi.override {
    plugins = [
      pkgs.rofi-emoji
      pkgs.rofi-calc
    ];
  };

}
