{
  description = "Multi-host NixOS + Home Manager configuration for Falador fleet";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    dotfiles.url = "github:wolfftech/dotfiles";
  };

  outputs = { self, nixpkgs, home-manager, dotfiles, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
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
          ];
        };
      }) [ "falador-tester"
           "falador-docker"
           "falador-download"
           "falador-media"
           "falador-gamesrv"
           "falador-bridge"
         ]);

      homeManagerConfigurations = builtins.listToAttrs (map (host: {
        name = host;
        value = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            dotfiles = dotfiles.packages.${system}.default;
          };
          modules = [ ./home/${host}.nix ];
          homeDirectory = "/home/wolff";
          configurationPackage = pkgs.callPackage ./modules/user-wolff.nix { };
          username = "wolff";
        };
      }) [ "falador-tester"
           "falador-docker"
           "falador-download"
           "falador-media"
           "falador-gamesrv"
           "falador-bridge"
         ]);
    };
}
