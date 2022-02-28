{ ... }:

{
  enable = true;
  historyControl = [ "ignorespace" ];
  historyIgnore = [ "exit" ];

  shellAliases = import ./aliases.nix {};

  initExtra = builtins.readFile ./init.bash;
}
