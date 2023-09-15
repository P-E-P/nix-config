{ config, lib, pkgs, ...}:
{
  imports = [
    ./home.nix
    ./hardware-configuration.nix
  ];

  networking = {

    hostName = "Omega"; # Define your hostname.
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

  sound.enable = true;
  hardware.opengl.enable = true;
  hardware.pulseaudio.enable = true;

  time.timeZone = "Europe/Paris";

  environment.variables = { 
    EDITOR = "vim";
    PAGER = "most";
  };


  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  programs = {
    light.enable = true;
  };

  services = {

    printing.enable = true;

    openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };

    };



    #pipewire = {
      #enable = true;
      #alsa.enable = true;
      #pulse.enable = true;
      #wireplumber.enable = false;
      #media-session.enable = true;
    #};

    mpd = import ./mpd.nix {};

    geoclue2.enable = true;
  };

  security.polkit.enable = true;
  security.pam.services = {

    sshd.googleAuthenticator.enable = true;

  };
  services.xserver.videoDrivers = [ "nvidia"];
  hardware.nvidia.modesetting.enable = true;

  virtualisation = {
    docker.enable = true;

    libvirtd = {
      enable = true;
      onBoot = "ignore";
      qemu.package = pkgs.qemu_kvm;
    };
  };

  fonts.packages = with pkgs; [
    iosevka
    dejavu_fonts
    nerdfonts
  ];

}
