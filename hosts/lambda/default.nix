{ config, lib, pkgs, ...}:
{
  imports = [
    ./home.nix
    ./hardware-configuration.nix
  ];

  networking = {

    hostName = "Lambda"; # Define your hostname.
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;

    networkmanager.enable = true;
    interfaces.wlp3s0.useDHCP = true;

    firewall = {
      allowedUDPPorts = [ 51820 ];
    };

  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Use the systemd-boot EFI boot loader.
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1"; # Needed by mpd to be able to use Pulseaudio
  };

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


  services = {
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      windowManager.i3.enable = true;
      displayManager.lightdm.enable = true;
    };

    mpd = import ./mpd.nix {};
  };
  hardware.opengl.driSupport32Bit = true;

  environment.variables = { 
    EDITOR = "vim";
    PAGER = "most";
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
