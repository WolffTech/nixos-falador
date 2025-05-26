{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "Falador-Download";

  # Extra packages
  environment.systemPackages = with pkgs; [
  ];
}

