{ config, lib, pkgs, ...}:
{
  users.mutableUsers = true;
  users.users.und = {
    isNormalUser = true;
    home = "/home/und";
    description = "Und";
    shell = pkgs.bash;
    uid = 4242;
    extraGroups = [
      "wheel"
      "media"
      "networkmanager"
      "video"
      "audio"
      "libvirtd"
      "docker"
    ];
  };
}
