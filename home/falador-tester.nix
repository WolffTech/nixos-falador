{ config, pkgs, ... }:

{

  home.stateVersion = "25.05";
  home.username = "wolff";
  home.homeDirectory = "/home/wolff";

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.zsh.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    neovim
    lazygit
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
