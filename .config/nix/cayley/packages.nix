{ config, pkgs, ... }: # Cayley NIX!

{

environment.systemPackages = with pkgs; [ # System essential programs
    autoconf
    automake
    bc
    btop
    cmake
    coreutils
    cudatoolkit
    file
    gcc
    git
    gmp
    gnumake
    htop-vim
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    llvmPackages_9.openmp
    lshw
    man-pages
    man-pages-posix
    mpfr
    mpi
    python3
    vim-full
];

users.users.alec.packages = with pkgs; [
    authy
    bat
    discord
    eza
    fastfetch
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
    obs-studio
    papirus-icon-theme
    pavucontrol
    protonup-ng
    qutebrowser
    rofi-wayland
    sage
    starship
    steam
    swaylock-effects
    texlive.combined.scheme-full
    tmux
    tutanota-desktop
    waybar
    wlsunset
    xdg-desktop-portal-gtk
    zathura
    zsh
];

programs = {
  zsh.enable = true;
  hyprland.enable = true;
};

environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
};

xdg.portal = {
  enable = true;
  extraPortals = [pkgs.xdg-desktop-portal-gtk];
  config = {
    common.default = "*";
  };
};


fonts.packages = with pkgs; [
   (nerdfonts.override {fonts  = ["IBMPlexMono"];})
];

documentation.dev.enable = true;

}
