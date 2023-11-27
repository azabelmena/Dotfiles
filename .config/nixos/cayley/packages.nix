{ config, pkgs, ... }:

{
# List packages installed in system profile. To search, run:
# Cayley NIX!

environment.systemPackages = with pkgs; [ # System essential programs
    autoconf
    automake
    bc
    btop
    cmake
    cudatoolkit
    file
    gcc
    git
    gmp
    gnumake
    htop-vim
    llvmPackages_9.openmp
    lshw
    mpi
    mpfr
    python3
    stdmanpages
    vim-full
];

users.users.alec.packages = with pkgs; [
    # zsh
    zsh
    #zsh-vi-mode

    # Essential Terminal Programs.
    kitty
    alacritty
    mpv
    neofetch
    tmux
    # Extra Terminal Programs
    eza
    bat
    starship
    vifm

    # Browsers
    authy
    qutebrowser

    # Desktop management
    dunst
    home-manager
    hyprland
    hyprpaper
    libnotify
    localsend
    pavucontrol
    rofi-wayland
    swaylock-effects
    waybar
    xdg-desktop-portal-gtk

    # mathematics and pdf viewing.
    geogebra
    inkscape
    sage
    texlive.combined.scheme-full
    zathura

    # Gaming
    discord
    obs-studio
    protonup-ng
    steam

    # Email services
    tutanota-desktop
];

programs.zsh.enable = true;

programs.hyprland = {
  enable = true;
  enableNvidiaPatches = true;
  xwayland.enable = true;
};
environment.sessionVariables = {
    #WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
};

xdg.portal.enable = true;
xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

fonts.packages = with pkgs; [
   (nerdfonts.override {fonts  = ["IBMPlexMono"];})
];

}
