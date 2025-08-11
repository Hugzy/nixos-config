{ pkgs, stable, lib, ... }:

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

  services.interception-tools = {
    enable = true;
    plugins = [pkgs.interception-tools-plugins.caps2esc];
    udevmonConfig = ''
      - JOB: "${pkgs.interception-tools}/bin/intercept -g $DEVNODE | ${pkgs.interception-tools-plugins.caps2esc}/bin/caps2esc | ${pkgs.interception-tools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };

  environment.systemPackages = with pkgs;
    [
      jq
      kubernetes-helm
      brave
      claude-code
    ] ++ [ pulumi ];

  networking.hostName = "work-desktop";

  use-home-manager.enable = true;
}
