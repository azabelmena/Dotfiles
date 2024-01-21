{ pkgs, lib, ... }:
{

  interfaces = {
    enp7s0.useDHCP = true;
    wlp0s20f3.useDHCP = true;
  };

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
      1024
      22
      4096
      443
      53317
      80
    ];
    allowedUDPPorts = [
      4096
      443
      53317
      80
    ];
  };
}
