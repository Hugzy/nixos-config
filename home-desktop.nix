{
  pkgs,
  unstable,
  lib,
  ...
}: let
  # Don't install the individual provider packages as we install them directly
  # as part of our automation scripts.
  pulumi = pkgs.pulumi-bin.overrideAttrs (finalAtrs: previousAttrs: {
    srcs = lib.lists.take 1 previousAttrs.srcs;
    postUnpack = "";
  });
in {
  imports = [
    ./hardware/home-desktop.nix
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

  programs.yazi.enable = true;

  environment.systemPackages = with pkgs;
    [
      jq
      brave
      claude-code
      discord
      jetbrains.datagrip
      jetbrains.rider
      jetbrains.webstorm
    ]
    ++ [pulumi];

  networking.hostName = "home-desktop";

  use-home-manager.enable = true;
}
