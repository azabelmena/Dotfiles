{ pkgs, ... }:
{
  openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;

      PermitRootLogin = false;
    };

  };

  avahi = {
  enable = true;
  nssmdns = true;
  openFirewall = true;
  };
}
