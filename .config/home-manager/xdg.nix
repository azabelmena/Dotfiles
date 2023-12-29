{ pkgs, config, ... }:

{

  enable = true;

  cacheHome = "~/.cache/";
  configHome = "~/.config/";
  dataHome = "~/.local/share/";
  stateHome = "~/.local/state/";

  userDirs = {
    enable = false;
    createDirectories = false;

    desktop = "~/Desktop/";
    documents = "~/Documents/";
    downloads = "~/Downloads/";
    music = "~/Music/";
    pictures = "~/Pictures/";
    videos = "~/Videos/";
    templates = "~/Templates/";
  };
}
