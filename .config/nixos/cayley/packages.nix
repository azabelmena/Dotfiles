{ config, pkgs, ... }:

{
# List packages installed in system profile. To search, run:
# Cayley NIX!

environment.systemPackages = with pkgs; [
    # System essential programs
    lshw
    file
    vim-full
    vifm
    gcc
    python3
    llvmPackages_9.openmp
    git

    # zsh
    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions

    # terminals
    starship
    kitty
    neofetch
    exa
    tmux

    # Browsers
    qutebrowser
    lynx
    authy

    # Desktop management
    hyprland
    waybar
    hyprpaper
    swaylock
    wofi
    dunst
    libnotify
    xdg-desktop-portal-gtk
    pavucontrol
    home-manager

    # Themeing
    nerdfonts

    # mathematics and pdf viewing.
    texlive.combined.scheme-full
    sage
    zathura
    inkscape
    geogebra

    # Gaming
    steam
    protonup-ng
    discord

    # Email services
    tutanota-desktop
];
programs.zsh.enable = true;

programs.hyprland = {
  enable = true;
  nvidiaPatches = true;
  xwayland.enable = true;
};
environment.sessionVariables = {
    #WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
};
hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
};
xdg.portal.enable = true;
xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

fonts.fonts = with pkgs; [
   (nerdfonts.override {fonts  = ["FiraCode"];})
];

}
