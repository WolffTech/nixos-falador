{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "Falador-Docker";

  # Extra packages
  environment.systemPackages = with pkgs; [
  ];
}

