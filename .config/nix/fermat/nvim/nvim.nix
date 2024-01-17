{ pkgs, config, ... }:
{
  enable = true;

  defaultEditor = true;

  viAlias = true;
  vimAlias = true;

  type = "lua";
  luaLoader.enable = true;

  options = ( import ./options.nix { inherit config; } );

  globals = ( import ./globals.nix { inherit config; } );

  autoCmd = ( import ./autocmd.nix );

  keymaps = ( import ./keymaps.nix );

  colorschemes = ( import ./colors.nix );

  plugins = ( import ./plugins.nix );

  enableMan = true;

}
