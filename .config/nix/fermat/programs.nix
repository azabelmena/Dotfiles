{ pkgs, config, ... }:
{
  mtr.enable = true;
  gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  nixvim = ( import ./nvim/nvim.nix { inherit pkgs config; } );

  zsh = ( import ./zsh.nix { inherit pkgs; } );
}
