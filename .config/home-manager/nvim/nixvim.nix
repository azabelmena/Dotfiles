{ pkgs, ... }:
{
  enable = true;

  defaultEditor = true;

  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;

  options = ( import ./options.nix );

  globals = ( import ./globals.nix );

  keymaps = ( import ./keymaps.nix );

  colorschemes.gruvbox.enable = true;

  plugins = {
    lualine.enable = true;
  };

  enableMan = true;
}
