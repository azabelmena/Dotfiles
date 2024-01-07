# RECOVERY NIX!

{inputs, config, pkgs, lib, ... }:

{

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      experimental-features = ["nix-command" "flakes"];
  };

  boot = ( import ./boot.nix { inherit pkgs; });

  networking = ( import ./networking.nix { inherit pkgs; });

  time.timeZone = "America/Puerto_Rico";

  environment = ( import ./environment.nix { inherit pkgs; } );

  i18n.defaultLocale = "en_US.UTF-8";
  console = lib.mkDefault {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = true;
  };

  services = ( import ./services.nix { inherit pkgs lib; } );

  security = ( import ./security.nix { inherit pkgs; } );

  users = ( import ./users.nix { inherit pkgs lib; } );

  programs = ( import ./programs.nix { inherit pkgs; } );

  documentation.dev.enable = true;

  system.stateVersion = "23.11";

}
