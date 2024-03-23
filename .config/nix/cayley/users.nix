{ pkgs, ... }:
{

  groups.ssh-users = {};

  users = {
    alec = {
      isNormalUser = true;
      extraGroups = [
        "libvirtd"
        "networkmanager"
        "wheel"
        "ssh-users"
      ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        bat
        blueberry
        discord
        eza
        fastfetch
        fd
        gamemode
        grimblast
        home-manager
        hyprland
        hyprpaper
        inkscape-with-extensions
        kitty
        libnotify
        localsend
        mako
        manix
        mpv
        obs-studio
        papirus-icon-theme
        pavucontrol
        protontricks
        protonup-ng
        protonvpn-cli
        protonvpn-gui_legacy
        qutebrowser
        ripgrep
        rofi-wayland
        starship
        swaylock-effects
        system76-keyboard-configurator
        tailscale
        texlive.combined.scheme-full
        tmux
        tutanota-desktop
        vifm
        waybar
        wlsunset
        xdg-desktop-portal-gtk
        zathura
        zoom-us
        zsh
      ];
    };
  };
}
