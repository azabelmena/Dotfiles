{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-soft;

  home.username = "alec";
  home.homeDirectory = "/home/alec";

  home.stateVersion = "23.11";

  home.sessionVariables = {
      EDITOR = "vim";
  };

  programs.home-manager.enable = true;

  home.packages = [
      (pkgs.nerdfonts.override { fonts = ["IBMPlexMono"]; })
  ];

  programs = {
      git = {
          enable = true;
          userName = "Alec S. Zabel-Mena";
          userEmail = "alec.zabel@upr.edu";
      };

      bash = (import ./bash/bash.nix { inherit pkgs; });
      kitty = (import ./kitty/kitty.nix { inherit pkgs config; });
      qutebrowser = (import ./qutebrowser/qutebrowser.nix { inherit pkgs config; });
      rofi = (import ./rofi.nix { inherit pkgs; });
      tmux = (import ./tmux.nix { inherit pkgs; });
      vim = (import ./vim.nix { inherit pkgs; });
      waybar = (import ./waybar/waybar.nix { inherit pkgs; });
      zathura = (import ./zathura.nix { inherit pkgs; });
      zsh = (import ./zsh/zsh.nix { inherit pkgs; });
  };

  home.file = {
      ".local/share/zsh/zsh-autosuggestions".source =
      "${pkgs.zsh-autosuggestions}/share/zhs-autosuggestions";
      "~/.config/kitty/kitty.conf".source = "${pkgs.kitty}/kitty/kitty.conf";
      "~/.config/qutebrowser/config.py".source = "${pkgs.qutebrowser}/qutebrowser/config.py";
      "~/.config/qutebrowser/quickmarks".source = "${pkgs.qutebrowser}/qutebrowser/quickmarks";
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
