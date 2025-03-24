{ pkgs, lib, ... }:

{
    vim = {
      languages = {
        enableTreesitter = true;

        nix.enable = true;
        };

        additionalRuntimePaths = [ "~/.config/nvim/" ];
      };
}
