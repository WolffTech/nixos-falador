{ config, pkgs, lib, ... }:

{
  networking.hostName = "Falador-GameSvr";
  networking.firewall.enable = lib.mkForce true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ 34197 ];

  networking.interfaces.ens18 = {
    ipv4.addresses = [
      {
        address = "172.16.1.25";
        prefixLength = 24;
      }
    ];
  };

  networking.defaultGateway = "172.16.1.1";
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];

  environment.systemPackages = with pkgs; [
    factorio-headless
    papermc
  ];
}
