{ config, pkgs, ... }:

{
  # Hostname
  networking.hostName = "Falador-Tester";

  # Extra packages
  environment.systemPackages = with pkgs; [
  ];
}
