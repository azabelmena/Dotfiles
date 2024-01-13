{ pkgs, config, ... }:
{
  enable = true;

  defaultEditor = true;

  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;

  options = ( import ./options.nix { inherit config; } );

  globals = ( import ./globals.nix );

  autoCmd = ( import ./autocmd.nix );

  keymaps = ( import ./keymaps.nix );

  colorschemes.gruvbox.enable = true;

  plugins = ( import ./plugins.nix { inherit pkgs; });

  enableMan = true;

}
