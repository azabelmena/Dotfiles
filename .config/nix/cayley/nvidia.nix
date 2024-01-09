{ config, ... }: # Cayley NIX!
{
  package = config.boot.kernelPackages.nvidiaPackages.stable;

  modesetting.enable = true;
  powerManagement.enable = false;
  powerManagement.finegrained = false;

  open = false; # Open source driver (nvidia-open-dkms)

  nvidiaSettings = true;

  prime = {
    allowExternalGpu = false;

    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
