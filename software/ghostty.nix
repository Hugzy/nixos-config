# ghostty.nix
{config, lib, pkgs, ...}:
{
  programs.ghostty = {
    enable = true;
    settings = {
        font-family = "FiraCode Nerd Font Mono";
	font-style = "regular";
	font-size = 18.00;
	background-opacity = 0.85;
	background-opacity-cells = true;
	initial-commnand = "${pkgs.tmux}/bin/tmux new-session -A -D -s main"
	};
    };
}
