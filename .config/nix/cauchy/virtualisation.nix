{ pkgs, ... }:

{
  libvirtd = {
    enable = true;

    qemu = {

      package = pkgs.qemu;

      runAsRoot = false;

      ovmf = {
        packages = pkgs.OVMFFull.fd;
        enable = true;
      };
    };

    allowedBridges = [
      "virbr0"
    ];

  };
}
