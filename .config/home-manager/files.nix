{ pkgs, config, ... }:
{
  ".local/share/zsh/zsh-autosuggestions".source =
  "${pkgs.zsh-autosuggestions}/share/zhs-autosuggestions";

  "nvim" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/nvim/lua/";
    target = ".config/nvim/lua/";
  };

  "ultisnips" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/nvim/UltiSnips";
    target = ".config/nvim/UltiSnips/";
  };

  "waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/waybar/style.css";
    target = ".config/waybar/style.css";
  };

  "fastfetch" = {
    recursive = true;
    source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.config/home-manager/fastfetch/config.jsonc";
    target = ".config/fastfetch/config.jsonc";
  };
}
