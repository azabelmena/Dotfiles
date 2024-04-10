{ pkgs, ... }:
{

#`services.xserver.layout
#`services.xserver.xkb.layout'.

  enable = true;
  xkb.layout = "us";
  videoDrivers = ["nvidia"];
  displayManager = {
    sddm = {
      enable = true;
      theme = "${import ./sddm.nix { inherit pkgs; }}";
      autoNumlock = false;
    };
  };
}
