# Cayley NIX!

{inputs, config, pkgs, lib, ... }:

{

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };
  nix.settings = {
      experimental-features = ["nix-command" "flakes"];
  };

  boot = ( import ./boot.nix { inherit pkgs; });

  fileSystems = ( import ./filesystems.nix );
  swapDevices = ( import ./swap.nix );

  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };

    users = {
      alec = import ../../home-manager/cayley.nix;
    };

    useGlobalPkgs = true;
    useUserPackages = true;
  };

  networking = ( import ./networking.nix { inherit pkgs lib; });

  time.timeZone = "America/Puerto_Rico";

  environment = ( import ./environment.nix { inherit pkgs; } );

  i18n.defaultLocale = "en_US.UTF-8";
  console = lib.mkDefault {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = true;
  };

  hardware = ( import ./hardware.nix { inherit pkgs config lib; });

  virtualisation = ( import ./virtualisation.nix { inherit pkgs; });

  services = ( import ./services.nix { inherit pkgs; } );

  sound.enable = true;

  xdg = ( import ./xdg.nix { inherit pkgs; } );

  security = ( import ./security.nix { inherit pkgs; } );

  users = ( import ./users.nix { inherit pkgs; } );

  programs = ( import ./programs.nix { inherit pkgs; } );

  fonts.packages = with pkgs; [
     (nerdfonts.override {fonts  = ["IBMPlexMono"];})
  ];

  documentation = ( import ./documentation.nix  );

  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs"
    "nixos-config=/home/alec/.config/nixos/cayley/configuration.nix"
  ];

  system.stateVersion = "unstable";

}
