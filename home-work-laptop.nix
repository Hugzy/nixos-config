{ pkgs, ... }:
{
  imports = [
    ./hardware/work-laptop.nix
    ./configuration.nix
    #./software/go.nix
    #./software/javascript.nix
    #./software/rust.nix
    #./software/dotnet.nix
  ];
  
  networking.hostName = "magida-work-laptop";

  use-home-manager.enable = true;
}
