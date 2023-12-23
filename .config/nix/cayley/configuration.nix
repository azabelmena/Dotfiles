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
  inputs.sops-nix.nixosModules.sops
];

home-manager = {
  extraSpecialArgs = { inherit inputs; };
  users.alec = import ../../home-manager/cayley.nix;
  useGlobalPkgs = true;
  useUserPackages = true;
};

boot.kernelPackages = pkgs.linuxPackages_zen;
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "cayley";
networking.networkmanager.enable = true;

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

services = {
  xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.theme = "${import ../../home-manager/sddm/sddm.nix { inherit pkgs; }}";
    };
  };
};

services.xserver.layout = "us";

services.printing.enable = true;

sound.enable = true;
security.rtkit.enable = true;
services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
};

hardware.system76.enableAll = true;
hardware.bluetooth.enable = true;
services.blueman.enable = true;

security.pam.services.swaylock = {
  text = ''
      auth include login
  '';
};

users.users.alec = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
};

nix.nixPath = [
  "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs"
  "nixos-config=/home/alec/.config/nixos/cayley/configuration.nix"
];

programs.mtr.enable = true;
programs.gnupg.agent = {
  enable = true;
  enableSSHSupport = true;
};

services.openssh.enable = true;

services.avahi = {
  enable = true;
  nssmdns = true;
  openFirewall = true;
};

networking.firewall.allowedTCPPorts = [ 80 443 22 53317 ];
networking.firewall.allowedUDPPorts = [ 80 443 22 53317 ];
networking.firewall.enable = false;

system.stateVersion = "unstable";

}
