{ pkgs, ... }:
{
  kernelPackages = pkgs.linuxPackages_latest;
  loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  initrd.availableKernelModules = [];
  initrd.kernelModules = [];
  kernelModules = [];
  extraModulePackages = [];
}
