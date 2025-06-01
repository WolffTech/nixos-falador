{ config, pkgs, lib, ... }:

let
  secrets = import ../secrets.nix;
in
{
  # hostname
  networking.hostName = "Falador-Media";

  # networking
  networking.firewall.enable = lib.mkForce true;
  networking.firewall.allowPing = lib.mkForce true;
  networking.firewall.allowedTCPPorts = [ 22 139 445 ];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

  networking.interfaces.ens18 = {
    ipv4.addresses = [
      {
        address = "172.16.1.24";
        prefixLength = 24;
      }
    ];
  };

  networking.defaultGateway = "172.16.1.1";
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  # extra packages
  environment.systemPackages = with pkgs; [
    cifs-utils
    plex
    jellyfin
  ];

  # mount smb share
  fileSystems."/mnt/ServerStorage" = {
    device = "//172.16.1.2/ServerStorage";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
    in ["${automount_opts},credentials=/etc/nixos/smb-secrets"];
  };
}
