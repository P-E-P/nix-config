{ pkgs, ... }:

{
  enable = true;
  plugins = with pkgs.vimPlugins; [
    vim-airline
    rust-vim
    vim-nix
    vim-gutentags
    jellybeans-vim
  ];
  settings = {
    relativenumber = true;
    number = true;
    expandtab = true;
    ignorecase = true;
    shiftwidth = 4;
    # The length of a tab, this is for documentation purpose only
    # do not change the default value of 8, ever.
    tabstop = 8;
  };

  extraConfig = builtins.readFile ./vimrc;
}
