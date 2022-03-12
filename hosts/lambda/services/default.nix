{ pkgs, ... }:

{
  polybar = import ./polybar.nix { inherit pkgs; };
}
