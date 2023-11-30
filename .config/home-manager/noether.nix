{ config, pkgs, inputs, lib, ... }:

{
    #imports = [
        #inputs.nix-colors.homeManagerModules.default
    #];
    #colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.

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
        XDG_CONFIG_HOME = ".config";
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

        bash = (import ./bash.nix { inherit pkgs; });
        zsh = (import ./zsh.nix { inherit pkgs; });
        tmux = (import ./tmux.nix { inherit pkgs; });
        kitty = (import ./kitty/kitty-darwin.nix { inherit pkgs; });
        zathura = (import ./zathura.nix { inherit pkgs; });
        #yabai = (import ./yabai.nix { inherit pkgs; });
        #skhd = (import ./skhd.nix { inherit pkgs; });
};

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
        ".local/share/zsh/zsh-autosuggestions".source =
        "${pkgs.zsh-autosuggestions}/share/zhs-autosuggestions";
    };
}
