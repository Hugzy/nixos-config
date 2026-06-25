{
  pkgs,
  lib,
  unstable,
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
    ./hardware/work-desktop.nix
    ./configuration.nix
    ./software/intune.nix
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
      kubernetes-helm
      brave
      unstable.claude-code
      jetbrains.datagrip
      jetbrains.rider
      jetbrains.webstorm
      jetbrains.rust-rover
      remmina
      ssm-session-manager-plugin
      packer
      remmina
      icu
      gh
      flyctl
      awscli2
    ]
    ++ [pulumi];

  networking.hostName = "work-desktop";

  # Hyprland doesn't activate the systemd graphical session on its own. This
  # wrapper target is started from hyprland.conf (exec-once) and BindsTo
  # graphical-session.target, bringing it up so user units that depend on it
  # run (e.g. Intune's intune-agent.timer). graphical-session.target itself
  # refuses manual start, hence the wrapper.
  systemd.user.targets.hyprland-session = {
    description = "Hyprland session";
    bindsTo = ["graphical-session.target"];
    wants = ["graphical-session-pre.target"];
    after = ["graphical-session-pre.target"];
  };

  use-home-manager.enable = true;
}
