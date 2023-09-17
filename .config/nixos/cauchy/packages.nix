{ config, pkgs, ... }:

{
# List packages installed in system profile. To search, run:

environment.systemPackages = with pkgs; [
    lshw
    file
vim

    zsh
    zsh-syntax-highlighting
    zsh-autosuggestions

    starship
    kitty

    qutebrowser
    lynx
    neofetch
    exa
    authy

    hyprland
    waybar
    hyprpaper
    swaylock
    wofi
    dunst
    libnotify
    xdg-desktop-portal-gtk

    nerdfonts
    home-manager

    texlive.combined.scheme-full
    zathura
    gcc
    python3
    llvmPackages_9.openmp
    git
    sage
    home-manager
];
programs.zsh.enable = true;

programs.hyprland = {
  enable = true;
  nvidiaPatches = true;
  xwayland.enable = true;
};
environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
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
