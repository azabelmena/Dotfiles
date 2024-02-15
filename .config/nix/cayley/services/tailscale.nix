{ pkgs, ... }:
{
  enable = true;
  package = pkgs.tailscale;

  openFirewall = true;

  port = 41641;
}
