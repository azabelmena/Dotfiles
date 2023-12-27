{ pkgs }:

let
  imgLink = "https://gruvbox-wallpapers.pages.dev/wallpapers/mix/houses.jpg";
  #imgLink = "https://github.com/azabelmena/Dotfiles/blob/main/Pictures/Wallpapers/gruvbox-dark-lockscreen-scalable.png?raw=true";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "0w9w5gjvdw9vc2xhv07z8c389jv2nrrd1kzkx1hid31q23bji4x7";
    #sha256 = "18fj7s6jfp5rbdirlc8hd94kl6xl94b25g7m66xwgaymbzxvv6yk";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
