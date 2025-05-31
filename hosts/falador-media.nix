{ config, pkgs, ... }:

{
  # hostname
  networking.hostName = "Falador-Media";

  # extra packages
  environment.systemPackages = with pkgs; [
    plex
    jellyfin
  ];
}
