{ config, lib, pkgs, ... }:
{

# Cayley NIX!

  hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;

      open = true; # Open source driver (nvidia-open-dkms)

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
}
