{ pkgs, config, ... }:
{

  "ultisnips" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/nvim/UltiSnips";
    target = ".config/nvim/UltiSnips";
  };

  #"waybar" = {
    #source = config.lib.file.mkOutOfStoreSymlink
    #"${config.home.homeDirectory}/.config/home-manager/waybar/style.css";
    #target = ".config/waybar/style.css";
  #};

  "fastfetch" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/fastfetch/config.jsonc";
    target = ".config/fastfetch/config.jsonc";
  };

  "vifm" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/vifm/vifmrc";
    target = ".config/vifm/vifmrc";
  };
}
