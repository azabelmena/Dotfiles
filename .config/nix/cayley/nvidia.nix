{ config, ... }: # Cayley NIX!
{
  package = config.boot.kernelPackages.nvidiaPackages.stable;

  modesetting.enable = true;
  powerManagement.enable = false;
  powerManagement.finegrained = false;

  open = true; # Open source driver (nvidia-open-dkms)

  nvidiaSettings = true;
}
