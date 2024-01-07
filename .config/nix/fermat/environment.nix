{ pkgs, ... }:
{

  systemPackages = with pkgs; [
      autoconf
      automake
      btop
      cmake
      coreutils
      file
      gcc
      git
      gmp
      gnumake
      htop-vim
      man-pages
      man-pages-posix
      python3
      vim-full
  ];

}
