{ config, pkgs, ... }:

{

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.firewall.enable = false;
  services.sshd.enable = true;

  environment.systemPackages = with pkgs; [
    git
  ];

  system.stateVersion = "24.11";
}

