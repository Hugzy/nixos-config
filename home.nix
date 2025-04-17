{ pkgs, ... }:
{
  imports = [
    ./software/go.nix
    ./software/javascript.nix
    ./software/rust.nix
    ./software/dotnet.nix
  ];

  home.username = "magida";

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

  home.stateVersion = "24.11";
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
