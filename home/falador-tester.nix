{ config, pkgs, dotfiles, ... }:

{
  home.packages = with pkgs; [
  ];

  home.file = {
    ".zshrc".source = "{dotfiles}/dot_zshrc";
  };
}
