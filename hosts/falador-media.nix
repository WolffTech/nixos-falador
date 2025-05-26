{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "Falador-Media";

  # Extra packages
  environment.systemPackages = with pkgs; [
  ];
}

