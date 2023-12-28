{ pkgs, ... }:
{
  openssh.enable = true;

  avahi = {
  enable = true;
  nssmdns4 = true;
  openFirewall = true;
  };

  xserver = {
    enable = true;
    layout = "us";
    displayManager = {
      sddm = {
        enable = true;
        theme = "${import ../../home-manager/sddm.nix { inherit pkgs; }}";
      };
    };
  };
  blueman.enable = true;

  pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
  };

  printing.enable = true;
}
