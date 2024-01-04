{ pkgs, ... }:
{
  openssh.enable = true;

  avahi = {

  enable = true;
  nssmdns4 = true;
  openFirewall = true;
  };

  acpid = {
    enable = true;
    logEvents = false;
  };

  xserver = {
    enable = true;
    layout = "us";
    displayManager = {
      sddm = {
        enable = true;
        theme = "${import ./sddm.nix { inherit pkgs; }}";
        autoNumlock = false;
      };
    };
  };

  blueman.enable = false;

  pipewire = {
    enable = true;
    audio.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    jack.enable = true;
  };

  printing = {
    enable = true;
    startWhenNeeded = true;
    stateless = true;
    tempDir = "/tmp/cups";

    allowFrom = [
      "127.0.0.1"
    ];

    listenAddresses = [
      "127.0.0.1:53317"
    ];

    openFirewall = false;
    logLevel = "info";
  };
}
