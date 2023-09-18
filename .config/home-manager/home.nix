{ config, pkgs, ... }:

{
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
    home.stateVersion = "22.11"; # Please read the comment before changing.

    home.sessionVariables = {
        EDITOR = "vim";
    };

    programs.home-manager.enable = true;

    home.packages = [
        # Fonts
        (pkgs.nerdfonts.override { fonts = ["IBMPlexMono"]; })
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
    };

    programs.git = {
        enable = true;
        userName = "Alec S. Zabel-Mena";
        userEmail = "alec.zabel@upr.edu";
        aliases = {
            dot="/run/current-system/sw/bin/git --git-dir=$HOME --work-tree=$HOME";
        };
    };

    gtk = {
        enable = true;
        theme = {
            name = "rose-pine-gtk-theme";
            package = pkgs.rose-pine-gtk-theme;
        };
        cursorTheme = {
            name = "Bibata-Modern-Ice";
            size = 24;
        };
        iconTheme = {
            name = "rose-pine-icon-theme";
            package = pkgs.rose-pine-icon-theme;
        };
    };
}
