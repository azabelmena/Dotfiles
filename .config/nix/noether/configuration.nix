# Noether NIX!

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
    coreutils
    gcc
    llvmPackages_15.openmp
    openmpi
    vim-full
    neofetch
    kitty
    zathura
    vim-full
    vifm
    inkscape
    qbittorrent
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-vi-mode
    inkscape
    qbittorrent
    starship
    sagetex
    skhd
    texlive.combined.scheme-full
    eza
    yabai
    bat
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

    yabai = {
      enable = true;
      config = {
        layout = "bsp";
        auto_balance = "off";
        split_ratio = "0.50";
        window_border = "on";
        window_border_width = "2";
        window_placement = "second_child";
        focus_follows_mouse = "autoraise";
        mouse_follows_focus = "off";
        top_padding = "10";
        bottom_padding = "10";
        left_padding = "10";
        right_padding = "10";
        window_gap = "10";
      };
    };

    skhd = {
      enable = true;
      skhdConfig = ''
        #cmd - return  : '/Applications/Nix Apps/kitty.app/Contents/MacOS'/kitty

        cmd - return      : open -a kitty
        cmd - b           : open -a qutebrowser

        cmd - t : yabai -m window --toggle float && yabai -m window --grid 4:4:1:1:2:2
        cmd - f : yabai -m window --toggle zoom-fullscreen
        cmd - q : yabai -m window --close

        cmd - h : yabai -m window --focus west
        cmd - j : yabai -m window --focus south
        cmd - k : yabai -m window --focus north
        cmd - l : yabai -m window --focus east

        cmd - tab         : yabai -m window --focus next
        cmd + shift - tab : yabai -m window --focus prev

        # Swap Window
        shift + cmd - h : yabai -m window --swap west
        shift + cmd - j : yabai -m window --swap south
        shift + cmd - k : yabai -m window --swap north
        shift + cmd - l : yabai -m window --swap east

        cmd - 1 : yabai -m space --focus 1
        cmd - 2 : yabai -m space --focus 2
        cmd - 3 : yabai -m space --focus 3
        cmd - 4 : yabai -m space --focus 4
        cmd - 5 : yabai -m space --focus 5
        #cmd - left : yabai -m space --focus prev
        #cmd - right: yabai -m space --focus next

        shift + cmd - 1 : yabai -m window --space 1
        shift + cmd - 2 : yabai -m window --space 2
        shift + cmd - 3 : yabai -m window --space 3
        shift + cmd - 4 : yabai -m window --space 4
        shift + cmd - 5 : yabai -m window --space 5
        #shift + cmd - left : yabai -m window --space prev && yabai -m space --focus prev
        #shift + cmd - right : yabai -m window --space next && yabai -m space --focus next

        #cmd + space : for now its using the default keybinding to open Spotlight Search
      '';
    };
  };

  # nix.package = pkgs.nix;
  programs.zsh.enable = true;
  environment.loginShell = pkgs.zsh;

  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
