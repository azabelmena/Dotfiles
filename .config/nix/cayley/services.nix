{ pkgs, ... }:
{
  openssh = ( import ./services/ssh.nix );

  avahi = ( import ./services/avahi.nix );

  acpid = ( import ./services/acpid.nix );

  xserver = ( import ./services/xserver.nix { inherit pkgs; } );

  pipewire = ( import ./services/pipewire.nix );

  printing = ( import ./services/printing.nix );

  tailscale = ( import ./services/tailscale.nix { inherit pkgs; } );
}
