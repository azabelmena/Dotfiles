{ pkgs, lib, ... }:
{

  interfaces = {
    enp3s0 = {
      useDHCP = true;
      wakeOnLan = {
        enable = true;
        policy = [ "unicast" "magic" ];
      };
    };

    wlo1.useDHCP = true;
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
      22
      53317
    ];
    allowedUDPPorts = [
      53317
    ];
  };
}
