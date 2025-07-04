{ config, pkgs, ... }:

{

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # bootloader
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  # qemu
  services.qemuGuest.enable = true;

  # networking
  networking.firewall.enable = false;
  services.openssh.enable = true;

  # allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
  };

  # system wide programs
  environment.systemPackages = with pkgs; [
    git
    home-manager
  ];

  # increase download buffer size as nixos-rebuild has been failing
  nix.settings.download-buffer-size = 16777216; # 16 MB

  # state version (do not change)
  system.stateVersion = "24.11";
}

