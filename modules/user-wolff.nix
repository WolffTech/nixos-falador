{ config, pkgs, ... }:

{
  users.users.wolff = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
