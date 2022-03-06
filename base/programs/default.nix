{ pkgs, ... }:
{
  programs = {
    command-not-found.enable = true;
  };

  environment.systemPackages = builtins.attrValues {
    inherit (pkgs)
      tree
      most
      git
      git-lfs
      gnumake
      python3
      htop
      wget
      vim
      pciutils
      file
      ;
  };
}
