{ pkgs, config, ... }:
{

package = pkgs.neovim-unwrapped;
  enable = true;

  defaultEditor = true;

  viAlias = true;
  vimAlias = true;

  withPython3 = true;

  plugins = with pkgs.vimPlugins; [
    nerdcommenter
    ultisnips
    vimtex
    gruvbox-nvim
    lualine-nvim
  ];

  extraLuaConfig = ''
    require("general")
    require("remap")
    require("vimtex")
    require("ultisnips")
    require("gruvbox").setup()
    require("lualine").setup()
  '';
}
