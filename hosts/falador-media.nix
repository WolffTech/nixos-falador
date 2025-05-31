{ config, pkgs, lib, ... }:

let
  secrets = import /etc/nixos/secrets.nix;
in
{
  # hostname
  networking.hostName = "Falador-Media";

  # extra packages
  environment.systemPackages = with pkgs; [
    plex
    jellyfin
  ];

  # mount smb share
  boot.kernelModules = [ "cifs" ];

  fileSystems."/mnt/ServerStorage" = {
    device  = "//172.16.1.2/ServerStorage";
    fsType  = "cifs";
    options = [
      "credentials=/etc/samba/creds"
      "uid=1000"
      "gid=100"
      "file_mode=0644"
      "dir_mode=0755"
    ];
  };

  environment.etc."samba/creds".text = lib.concatStringsSep "\n" [
    "username=${secrets.username}"
    "password=${secrets.password}"
  ];
  environment.etc."samba/creds".mode = "0600";
}
