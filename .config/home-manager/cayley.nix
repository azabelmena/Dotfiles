{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];
  colorScheme = inputs.nix-colors.colorSchemes.everforest;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alec";
  home.homeDirectory = "/home/alec";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

    home.sessionVariables = {
        EDITOR = "vim";
        #XDG_CONFIG_HOME = ".config";
    };

    programs.home-manager.enable = true;

    home.packages = [
        # Fonts
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
