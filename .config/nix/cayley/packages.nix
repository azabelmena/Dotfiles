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
    mpfr
    mpi
    python3
    stdmanpages
    vim-full
];

users.users.alec.packages = with pkgs; [
    authy
    bat
    discord
    eza
    geogebra
    grimblast
    home-manager
    hugo
    hyprland
    hyprpaper
    inkscape-with-extensions
    kitty
    fastfetch
    libnotify
    localsend
    mako
    manix
    mpv
    obs-studio
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
    vifm
    waybar
    xdg-desktop-portal-gtk
    zathura
    zsh
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
