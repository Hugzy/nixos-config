{
  description = "Nixos config flake";

  inputs = {
    stableNixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stableNixpkgs, nixCats, ... }@inputs:
  let
    stablePkgs = import stableNixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
      #pkgs = nixpkgs.legacyPackages.${system};
     allPkgs = inputs // {
        stable = stablePkgs;
      };
  in {
    nixosConfigurations.magida-work-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = allPkgs;
      modules = [
        ./home-work-laptop.nix
        ./home-manager-module.nix
      ];
    };

    nixosConfigurations.work-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = allPkgs;
      modules = [
        ./work-desktop.nix
        ./home-manager-module.nix
      ];
    };
  };
}
