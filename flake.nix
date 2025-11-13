{
  description = "Nixos config flake";

  inputs = {
    unstableNixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; #"github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim = {
      url = "github:Hugzy/neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    unstableNixpkgs,
    neovim,
    ...
  } @ inputs: let
    unstablePkgs = import unstableNixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    allInputs =
      inputs
      // {
        unstable = unstablePkgs;
        neovim = neovim;
      };
  in {
    nixosConfigurations.magida-work-laptop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = allInputs;
      modules = [
        ./home-work-laptop.nix
        ./home-manager-module.nix
      ];
    };

    nixosConfigurations.work-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = allInputs;
      modules = [
        ./work-desktop.nix
        ./home-manager-module.nix
      ];
    };

    nixosConfigurations.home-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = allInputs;
      modules = [
        ./home-desktop.nix
        ./home-manager-module.nix
      ];
    };
  };
}
