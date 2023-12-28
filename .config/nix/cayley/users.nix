{ pkgs, ... }:
{

  users = {
    alec = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      shell = pkgs.zsh;
      packages = with pkgs; [
        authy
        bat
        discord
        eza
        fastfetch
        fd
        gamemode
        geogebra
        grimblast
        home-manager
        hugo
        hyprland
        hyprpaper
        inkscape-with-extensions
        kitty
        lf
        libnotify
        localsend
        mako
        manix
        mpv
        neovim
        obs-studio
        papirus-icon-theme
        pavucontrol
        protonup-ng
        qutebrowser
        ripgrep
        rofi-wayland
        starship
        swaylock-effects
        system76-keyboard-configurator
        texlive.combined.scheme-full
        tmux
        tutanota-desktop
        waybar
        wlsunset
        xdg-desktop-portal-gtk
        zathura
        zsh
      ];
    };
  };
}
