{ pkgs, config, lib, ... }:
{
  package = pkgs.rofi-wayland;
  enable = true;

  font = "BlexMono Nerd Font Bold 12";
  theme = ( import ./theme.nix { inherit pkgs config lib; } );

  extraConfig = {
    modi = "combi";
    display-drun = "drun";
    display-run = "run";
    display-window = "window";
    show-icons = true;
  };

  plugins = [
    pkgs.rofi-calc
  ];
}
