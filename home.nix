{ pkgs, stable, ... }:
{
  imports = [
    ./software/go.nix
    ./software/javascript.nix
    ./software/rust.nix
    ./software/dotnet.nix
  ];

  home.username = "frederikhm";
  home.homeDirectory = "/home/frederikhm";

  home.packages = with pkgs; [
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    neofetch
    ripgrep
    postman
    kubectl
    azure-cli
    lens
    flameshot
    jetbrains.datagrip
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Hugzy";
    userEmail = "frede.madsen3@gmail.com";
    extraConfig = {
      push = { 
        autoSetupRemote = true;
      };
      pull = {
        rebase = true;
      };
    };
  };

  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      # add_newline = false;

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };
  };

  home.stateVersion = "25.05";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
