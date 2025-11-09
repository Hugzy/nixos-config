{ pkgs, stable, ... }:
let
  onePassPath = "/home/frederikhm/.1password/agent.sock";
in 
{
  imports = [
    ./software/go.nix
    ./software/javascript.nix
    ./software/rust.nix
    ./software/dotnet.nix
    # ./software/nvim.nix
    ./software/tmux.nix
    ./software/alacritty.nix
    ./software/ghostty.nix
    ./software/llm.nix
    ./software/starship.nix
  ];

  home.username = "frederikhm";
  home.homeDirectory = "/home/frederikhm";

  #Should be able to reference hyprland dotfile without using nix configuration with this
  #home.file."${config.xdg.configHome}/hypr" = {
    #source = ../dotfiles/hypr;
    #recursive = true;
  #};

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
    obs-studio
    vlc
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


  home.stateVersion = "25.05";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
