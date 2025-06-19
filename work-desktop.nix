{ pkgs, lib, ... }:

let
  # Don't install the individual provider packages as we install them directly
  # as part of our automation scripts.
  pulumi = pkgs.pulumi-bin.overrideAttrs (finalAtrs: previousAttrs: {
    srcs = lib.lists.take 1 previousAttrs.srcs;
    postUnpack = "";
  });
in {
  imports = [
    ./hardware/work-desktop.nix
    ./configuration.nix
  ];

  environment.systemPackages = with pkgs;
    [
      jq
    ] ++ [ pulumi ];

  networking.hostName = "work-desktop";

  use-home-manager.enable = true;
}
