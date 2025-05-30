{
  description = "Multi-host NixOS + Home Manager configuration for Falador fleet";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hosts = [
        "falador-tester"
        "falador-docker"
        "falador-download"
        "falador-media"
        "falador-gamesvr"
        "falador-bridge"
      ];
    in {
      nixosConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./modules/common.nix
            ./modules/ssh.nix
            ./modules/user-wolff.nix
            ./hosts/${host}-hardware.nix
            ./hosts/${host}.nix
            # I don't like this and will clean it up eventually. It works for now though and I'm sick of working on it.
            home-manager.nixosModules.home-manager
            ({ config, pkgs, lib, ... }:
            {
              home-manager.users.wolff = {
                home.stateVersion = "25.05";
                imports = [ ./home/${host}.nix ];
              };
            })
          ];
        };
      }) hosts);
    };
}
