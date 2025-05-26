{ config, pkgs, dotfiles, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.zsh.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    nvim
    lazygit
  ];

  home.file = {
    ".zshrc".source = "{dotfiles}/dot_zshrc";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
