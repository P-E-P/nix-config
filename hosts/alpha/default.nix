{ config, lib, pkgs, ... }:
{
  imports = [
    ./home.nix
    ./hardware-configuration.nix
  ];

  networking = {

    hostName = "Alpha";
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.eno1.useDHCP = true;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    openssh.enable = true;

    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      displayManager.lightdm.enable = true;
    };

  };

  environment.variables = { 
    EDITOR = "vim";
  };


  virtualisation = {
    docker.enable = true;

    libvirtd = {
      enable = true;
      onBoot = "ignore";
      qemu.package = pkgs.qemu_kvm;
    };
  };

}
