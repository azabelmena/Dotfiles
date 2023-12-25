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
    luasnip
    vim-nix
    vimtex
    gruvbox-nvim
    lualine-nvim
  ];

  extraLuaConfig = ''

    local ls = require("luasnip")

    require("general")
    require("remap")
    require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})
    require("gruvbox").setup()
    require("lualine").setup()
  '';
}
