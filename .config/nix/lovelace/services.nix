{ pkgs, ... }:
{
  openssh.enable = true;

  avahi = {
  enable = true;
  nssmdns = true;
  openFirewall = true;
  };
}
