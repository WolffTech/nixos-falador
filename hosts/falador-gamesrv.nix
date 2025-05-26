{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "Falador-Gamesvr";

  # Extra packages
  environment.systemPackages = with pkgs; [
  ];
}

