{pkgs, ...}: {
  home.packages = [
    pkgs.wofi
    pkgs.waybar
    pkgs.hyprshot
    pkgs.swaynotificationcenter
    pkgs.libnotify
    pkgs.hyprlock
    pkgs.hypridle
    pkgs.hyprpaper
    pkgs.hyprsunset
    pkgs.wlogout
  ];
}
