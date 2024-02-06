{ pkgs, ... }:
{
  enable = true;
  layout = "us";
  videoDrivers = ["nvidia"];
  displayManager = {
    sddm = {
      enable = true;
      theme = "${import ./sddm.nix { inherit pkgs; }}";
      autoNumlock = false;
    };
  };
}
