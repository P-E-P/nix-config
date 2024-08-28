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

  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1"; # Needed by mpd to be able to use Pulseaudio
    };

    graphics.enable32Bit = true;
  };

  time.timeZone = "Europe/Paris";

  environment.variables = { 
    EDITOR = "vim";
    PAGER = "most";
  };


  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };

      displayManager.lightdm.enable = true;
    };

    mpd = import ./mpd.nix {};
  };

  security.pam.services = {

    sshd.googleAuthenticator.enable = true;

  };

  virtualisation = {
    docker.enable = true;

    libvirtd = {
      enable = true;
      onBoot = "ignore";
      qemu.package = pkgs.qemu_kvm;
    };
  };

  fonts.fonts = with pkgs; [
    iosevka
    dejavu_fonts
    nerdfonts
  ];

}
