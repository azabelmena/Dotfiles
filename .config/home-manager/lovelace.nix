{ config, pkgs, inputs, lib, ... }:  # LOVELACE NIX!

{
  home = {
    username = "turing";
    homeDirectory = "/home/turing";
    stateVersion = "23.11";

    sessionVariables = {
        EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;

  programs = {
      bash = (import ./bash/bash.nix { inherit pkgs; });
      git = ( import ./git.nix { inherit pkgs; } );
      kitty = (import ./kitty/kitty.nix { inherit pkgs config; });
      neovim = ( import ./nvim/nvim.nix { inherit pkgs config; } );
      starship = ( import ./starship.nix { inherit pkgs config; });
      zsh = (import ./zsh/zsh.nix { inherit pkgs; });
  };
}
