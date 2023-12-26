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
      zathura = (import ./zathura.nix { inherit pkgs; });
      zsh = (import ./zsh/zsh.nix { inherit pkgs; });
  };

    home.file = {
      ".local/share/zsh/zsh-autosuggestions".source =
      "${pkgs.zsh-autosuggestions}/share/zhs-autosuggestions";

      "nvim" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
        "/home/alec/.config/home-manager/nvim/lua/";
        target = ".config/nvim/lua/";
      };

      "ultisnips" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
        "/home/alec/.config/home-manager/nvim/UltiSnips";
        target = ".config/nvim/UltiSnips/";
      };

      "waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink
        "/home/alec/.config/home-manager/waybar/style.css";
        target = ".config/waybar/style.css";
      };
  };

  gtk = {
      enable = true;
      theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
      };
      cursorTheme = {
      name = "GoogleDot-Black";
      package = pkgs.google-cursor;
      size = 16;
      };
  };
}
