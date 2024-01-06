{ pkgs, ... }:
{
  rtkit.enable = true;

  audit = {
    enable = true;

    backlogLimit = 512;
    rateLimit = 1000;
  };
}
