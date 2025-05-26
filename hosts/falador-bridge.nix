{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "Falador-Bridge";

  # Extra packages
  environment.systemPackages = with pkgs; [
  ];
}

