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
    openmpi
    python3
    qbittorrent
    sagetex
    skhd
    starship
    texlive.combined.scheme-full
    vifm
    vim-full
    yabai
    zathura
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

    yabai = {
      enable = true;
      enableScriptingAddition = true;
      config = {
        layout = "bsp";
        auto_balance = "off";
        split_ratio = "0.50";
        window_border = "on";
        window_border_width = "10";
        window_placement = "second_child";
        focus_follows_mouse = "off";
        mouse_follows_focus = "off";
        top_padding = "10";
        bottom_padding = "10";
        left_padding = "10";
        right_padding = "10";
        window_gap = "10";
      };
      extraConfig=''
        sudo yabai --load-sa
        source "~/.config/colors.sh"

        yabai -m rule --add app="^(System Settings)$" manage=off
      '';
    };

    skhd = {
      enable = true;
      skhdConfig = ''
        cmd - return      : '/Applications/Nix Apps/kitty.app/Contents/MacOS'/kitty --hold sh -c 'cd'
        cmd - b           : /Applications/qutebrowser.app/Contents/MacOS/qutebrowser
        ctrl + cmd - z    : zathura

        cmd - t           : yabai --message window --toggle float && yabai --message window --grid 4:4:1:1:2:2
        cmd - f           : yabai --message window --toggle zoom-fullscreen
        cmd - q           : yabai --message window --close

        cmd - h           : yabai --message window --focus west
        cmd - j           : yabai --message window --focus south
        cmd - k           : yabai --message window --focus north
        cmd - l           : yabai --message window --focus east

        cmd - tab         : yabai --message window --focus next
        shift + cmd - tab : yabai --message window --focus prev

        ctrl + cmd - tab  : yabai --message space --create
        shift + ctrl + cmd - tab  : yabai --message space --destroy

        ctrl + cmd - h    : yabai --message space --focus first
        ctrl + cmd - l    : yabai --message space --focus last

        cmd - 1           : yabai --message space --focus 1
        cmd - 2           : yabai --message space --focus 2
        cmd - 3           : yabai --message space --focus 3
        cmd - 4           : yabai --message space --focus 4
        cmd - 5           : yabai --message space --focus 5
        cmd - 6           : yabai --message space --focus 6
        cmd - 7           : yabai --message space --focus 7
        cmd - 8           : yabai --message space --focus 8
        cmd - 9           : yabai --message space --focus 9

        shift + cmd - 1   : yabai --message window --space 1 --focus
        shift + cmd - 2   : yabai --message window --space 2 --focus
        shift + cmd - 3   : yabai --message window --space 3 --focus
        shift + cmd - 4   : yabai --message window --space 4 --focus
        shift + cmd - 5   : yabai --message window --space 5 --focus
        shift + cmd - 6   : yabai --message window --space 6 --focus
        shift + cmd - 7   : yabai --message window --space 7 --focus
        shift + cmd - 8   : yabai --message window --space 8 --focus
        shift + cmd - 9   : yabai --message window --space 9 --focus

        # Swap Window
        shift + cmd - h   : yabai --message window --swap west
        shift + cmd - j   : yabai --message window --swap south
        shift + cmd - k   : yabai --message window --swap north
        shift + cmd - l   : yabai --message window --swap east

        #cmd + space      : for now its using the default keybinding to open Spotlight Search
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
