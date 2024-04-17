{ pkgs, ... }:
{

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
    hugo
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
    qutebrowser
    ripgrep
    rofi-wayland
    starship
    swaylock-effects
    system76-keyboard-configurator
    tailscale
    texlive.combined.scheme-full
    tmux
    vifm
    waybar
    wlsunset
    xdg-desktop-portal-gtk
    zathura
    zoom-us
    zsh
  ];

}
