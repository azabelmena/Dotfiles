{ pkgs, ... }:
{
  rtkit.enable = true;

  audit = {
    enable = true;

    backlogLimit = 512;
    rateLimit = 1000;
  };
  auditd.enable = true;

  polkit = {
    enable = true;
    debug = true;
    adminIdentities = [
      "unix-group:wheel"
    ];
  };

  pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };
}
