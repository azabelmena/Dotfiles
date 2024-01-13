{pkgs, ...}:
{
  lualine = ( import ./plugins/lualine.nix );

  telescope = ( import ./plugins/telescope.nix );

  vimtex = ( import ./plugins/vimtex.nix );

  floaterm = ( import ./plugins/floaterm.nix );

}
