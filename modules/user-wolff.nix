{ config, pkgs, ... }:

{
  users.users.wolff = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];  # sudo
    ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
