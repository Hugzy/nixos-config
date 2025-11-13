# ghostty.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "FiraCode Nerd Font Mono";
      font-family-bold = "Symbols Nerd Font";
      font-style = "regular";
      font-size = 18.00;
      background-opacity = 0.90;
      #background-opacity-cells = true;
      initial-command = "${pkgs.tmux}/bin/tmux new-session -A -D -s main";
    };
  };
}
