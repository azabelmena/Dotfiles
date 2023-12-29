{ pkgs, ... }:
{
  hostName = "cayley";
  networkmanager = {
    enable = true;
    dns = "default";
    logLevel = "INFO";
  };
  firewall = {
    package = pkgs.iptables-legacy;
    enable = true;
    allowPing = true;
    pingLimit = "--limit 1/minute --limit-burst 5";
    allowedTCPPorts = [
      22
      80
      443
      1024
      53317
    ];
    allowedUDPPorts = [
      80
      443
      53317
    ];
  };
}
