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
    plenary-nvim
    nvim-treesitter.withAllGrammars
    telescope-nvim
    telescope-fzf-native-nvim
    telescope-file-browser-nvim

    gruvbox-nvim
    lualine-nvim
  ];

  extraLuaConfig = ''
    require("general")
    require("remap")
    require("vimtex")
    require("ultisnips")
    require("telescope")

    require("gruvbox").setup()
    require("lualine").setup()
  '';
}
