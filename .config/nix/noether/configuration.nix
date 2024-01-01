# Noether NIX!
# HAPPY NEW YEAR!!!

{inputs, config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      experimental-features = ["nix-command" "flakes"];
  };

  users.users.alec = {
    name = "alec";
    home = "/Users/alec";
  };

  environment.systemPackages = with pkgs; [
    bat
    coreutils
    discord
    eza
    fastfetch
    gcc
    git
    hugo
    inkscape
    inkscape
    jq
    kitty
    libreoffice-bin
    llvmPackages_15.openmp
    manix
    mpv
    neovim
    openmpi
    python3
    qbittorrent
    sagetex
    skhd
    spacebar
    starship
    texlive.combined.scheme-full
    vifm
    vim-full
    yabai
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
  ];

  documentation.enable = true;

  fonts.fontDir.enable = true;

  system = {
    checks = {
      verifyBuildUsers = true;
      verifyNixChannels = true;
      verifyNixPath = true;
  };

    defaults = {
      finder = {
        AppleShowAllExtensions = true;
        _FXShowPosixPathInTitle = true;
        CreateDesktop = false;
      };

      screencapture.location = "/tmp/";

      dock.autohide = true;
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  environment.darwinConfig = "$HOME/.config/nix/noether/configuration.nix";

  services = {
    nix-daemon.enable = true;

    yabai = ( import ../../home-manager/yabai.nix { inherit pkgs; } );
    skhd = ( import ../../home-manager/skhd.nix { inherit pkgs; } );
    spacebar = ( import ../../home-manager/spacebar.nix { inherit pkgs; } );
  };

 security.pam.enableSudoTouchIdAuth = true;

  # nix.package = pkgs.nix;
  programs.zsh.enable = true;
  environment.loginShell = pkgs.zsh;

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
