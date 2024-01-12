{ pkgs, config, lib, ... }:
{
  cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  bluetooth.enable = true;

  opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
  };
}