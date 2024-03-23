{ pkgs, ... }:
{

  sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
  };

  systemPackages = with pkgs; [
      OVMFFull
      age
      autoconf
      automake
      bc
      btop
      cmake
      coreutils
      file
      gcc
      git
      gnumake
      htop-vim
      iptables-legacy
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtquickcontrols2
      libvirt
      lshw
      man-pages
      man-pages-posix
      openssh
      openvpn
      polkit_gnome
      qemu
      vim-full
      virt-manager
  ];

}
