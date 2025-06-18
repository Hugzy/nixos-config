{ pkgs, ... }:
{
  imports = [
    ./hardware/work-desktop.nix
    ./configuration.nix
    #./software/go.nix
    #./software/javascript.nix
    #./software/rust.nix
    #./software/dotnet.nix
  ];

  networking.hostName = "work-desktop";

  use-home-manager.enable = true;
}
