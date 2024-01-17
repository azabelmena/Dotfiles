{ pkgs, config, lib, ... }:
{
  cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  bluetooth.enable = false;

  opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
  };
  #nvidia = ( import ./nvidia.nix { inherit config; });
}
