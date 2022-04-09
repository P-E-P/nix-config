{ pkgs, ... }:

{

  picom = import ./picom { inherit pkgs; };

  polybar = import ./polybar { inherit pkgs; };

}
