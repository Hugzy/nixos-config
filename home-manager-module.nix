{lib, config, unstable, home-manager, neovim, ...}:
{
   imports = [home-manager.nixosModules.default];

   options.use-home-manager.enable = lib.mkEnableOption "enable home manager with my settings";

   config = lib.mkIf config.use-home-manager.enable {
        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            # I would put this elsewhere
            users.frederikhm= import ./home.nix;
            extraSpecialArgs = {
                inherit unstable;
                inherit neovim;
            };
        };
   };
}
