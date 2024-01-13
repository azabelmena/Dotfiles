{pkgs, ...}:
{
  lualine = ( import ./plugins/lualine.nix );

  telescope = ( import ./plugins/telescope.nix );
}
