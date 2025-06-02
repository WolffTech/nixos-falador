{ config, pkgs, lib, ... }:

{
  # Hostname
  networking.hostName = "Falador-Bridge";

  # networking
  networking.firewall.enable = lib.mkForce true;
  networking.firewall.allowPing = lib.mkForce true;
  networking.firewall.allowedTCPPorts = [ 22 80 139 443 445 7844];
  networking.firewall.allowedUDPPorts = [ 137 138 ];

  networking.interfaces.ens18 = {
    ipv4.addresses = [
      {
        address = "172.16.1.20";
        prefixLength = 24;
      }
    ];
  };

  networking.defaultGateway = "172.16.1.1";
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  # extra packages
  environment.systemPackages = with pkgs; [
    cloudflared
  ];
}
