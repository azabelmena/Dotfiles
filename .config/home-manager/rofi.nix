{ pkgs, ... }:
{
  enable = true;
  configPath = "/home/alec/.config/rofi/config.rasi";

  font = "BlexMono Nerd Font Bold 12";
  theme = "gruvbox-dark-soft";

  extraConfig = {
    modi = "drun";
    display-drun = "Apps";
    display-window = "Window";
    show-icons = true;
  };

  plugins = [
    pkgs.rofi-calc
  ];
}
