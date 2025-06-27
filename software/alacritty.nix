# alacritty.nix
{config, lib, pkgs, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
        window = {
          opacity = 0.85;
        };
        font = {
          normal = {
            family = "FiraCode Nerd Font Mono"; 
            style = "regular";
          };
          size = 18.00;
        };
        terminal.shell = {
          args = ["new-session"  "-A"  "-D" "-s" "main"];
          program = "${pkgs.tmux}/bin/tmux";
      };
    };
  };
}
