{ config, pkgs, inputs, lib, ... }: #NOETHER NIX!

{
    imports = [
      inputs.nix-colors.homeManagerModules.default
      inputs.nixvim.homeManagerModules.nixvim
    ];
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-soft;

    home.username = "alec";
    home.homeDirectory = "/Users/alec";

    home.stateVersion = "23.11";

    home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = ".config";
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      (nerdfonts.override { fonts = ["IBMPlexMono"]; })
    ];

    programs = {
      git = {
        enable = true;
        userName = "Alec S. Zabel-Mena";
        userEmail = "alec.zabel@upr.edu";
      };

      bash = (import ./bash/bash-darwin.nix { inherit pkgs; });
      kitty = (import ./kitty/kitty-darwin.nix { inherit pkgs config; });
      nixvim = ( import ./nvim/nixvim.nix { inherit pkgs; } );
      qutebrowser = (import ./qutebrowser/qutebrowser.nix { inherit pkgs config; });
      starship = ( import ./starship.nix { inherit pkgs config; });
      tmux = (import ./tmux.nix { inherit pkgs; });
      zsh = (import ./zsh/zsh-darwin.nix { inherit pkgs; });
    };

  home.file = ( import ./files.nix { inherit pkgs config lib; });
}
