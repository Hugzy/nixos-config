{ pkgs, stable, lib, ... }:
{
  imports = [
    ./hardware/home-desktop.nix
    ./configuration.nix
    ./software/ghostty.nix
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

  environment.systemPackages = with stable;
    [
      jq
      brave
      claude-code
      discord
      ghostty
    ];

  networking.hostName = "home-desktop";

  use-home-manager.enable = true;

}
