{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";
  home.username = "wolff";
  home.homeDirectory = "/home/wolff";

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.git.enable = true;

  home.packages = with pkgs; [
    # tools
    zsh
    neovim
    lazygit
    lazydocker
    tmux
    btop
    zip
    unzip

    # cli tools
    fzf
    bat
    eza
    gh
    jq
    zoxide
    wget
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
