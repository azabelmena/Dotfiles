# Cayley NIX!

{inputs, config, pkgs, lib, ... }:

{

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      experimental-features = ["nix-command" "flakes"];
  };

  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./nvidia.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.alec = import ../../home-manager/cayley.nix;
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  boot = ( import ./boot.nix { inherit pkgs; });

  networking = ( import ./networking.nix { inherit pkgs; });


  time.timeZone = "America/Puerto_Rico";

  environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = lib.mkDefault {
      font = "Lat2-Terminus16";
      keyMap = "us";
      useXkbConfig = true;
  };

  hardware = {
    system76.enableAll = true;
    bluetooth.enable = true;
  };

  services = ( import ./services.nix { inherit pkgs; } );

  sound.enable = true;

  security = ( import ./security.nix { inherit pkgs; } );

  users.users.alec = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      shell = pkgs.zsh;
  };

  nix.nixPath = [
    "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs"
    "nixos-config=/home/alec/.config/nixos/cayley/configuration.nix"
  ];

  system.stateVersion = "unstable";

}
