{ config, pkgs, inputs, lib, ... }:  # CAYLEY NIX!

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-soft;

  home.username = "alec";
  home.homeDirectory = "/home/alec";

  home.stateVersion = "23.11";

  home.sessionVariables = {
      EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  home.packages = [
    (pkgs.nerdfonts.override { fonts = ["IBMPlexMono"]; })
  ];

  wayland.windowManager.hyprland = ( import ./hyprland.nix { inherit pkgs config;});

  services = {
    mako = ( import ./mako.nix { inherit pkgs config; } );
  };

  programs = {
      bash = (import ./bash/bash.nix { inherit pkgs; });
      git = ( import ./git.nix { inherit pkgs; } );
      kitty = (import ./kitty/kitty.nix { inherit pkgs config; });
      qutebrowser = (import ./qutebrowser/qutebrowser.nix { inherit pkgs config; });
      rofi = (import ./rofi/rofi.nix { inherit pkgs config lib; });
      starship = ( import ./starship.nix { inherit pkgs config; });
      swaylock = ( import ./swaylock.nix { inherit pkgs config; });
      tmux = (import ./tmux.nix { inherit pkgs; });
      neovim = ( import ./nvim/nvim.nix { inherit pkgs config; } );
      waybar = (import ./waybar/waybar.nix { inherit pkgs; });
      zathura = (import ./zathura.nix { inherit pkgs config; });
      zsh = (import ./zsh/zsh.nix { inherit pkgs; });
  };

  home.file = ( import ./files/files.nix { inherit pkgs config lib; });

  gtk = ( import ./gtk.nix { inherit pkgs; });
  qt = ( import ./qt.nix { inherit pkgs; });
}
