{ config, lib, pkgs, ... }:
{

# Cayley NIX!

  boot.kernelParams = [
    "i915.modeset=1"
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  hardware.opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      forceFullCompositionPipeline = true;

      open = true; # Open source driver (nvidia-open-dkms)

      nvidiaSettings = true;
    };
}
