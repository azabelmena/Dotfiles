# Cayley NIX!

{ config, pkgs, ... }:

{

nixpkgs.config.allowUnfree = true;
nix.settings = {
    experimental-features = ["nix-command" "flakes"];
};

imports = [
  /etc/nixos/hardware-configuration.nix
  ./packages.nix
  ./nvidia.nix
];

# Use the systemd-boot EFI boot loader.
boot.kernelPackages = pkgs.linuxPackages_latest;
boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "cayley"; # Define your hostname.
# Pick only one of the below networking options.
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = "America/Puerto_Rico";

environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
};
environment.systemPackages = [
  pkgs.libsForQt5.qt5.qtquickcontrols2
  pkgs.libsForQt5.qt5.qtgraphicaleffects
];

# Select internationalisation properties.
#i18n.defaultLocale = "en_US.UTF-8";
#console = {
#    font = "Lat2-Terminus16";
#    keyMap = "us";
#    useXkbConfig = true; # use xkbOptions in tty.
#};

# Enable the X11 windowing system.
services.xserver = {
  enable = true;
  displayManager = {
    sddm.enable = true;
    sddm.theme = "${import /home/alec/.config/home-manager/sddm/sddm.nix { inherit pkgs; }}";
  };
};

# Configure keymap in X11
#services.xserver.layout = "us";
#services.xserver.xkbOptions = "eurosign:e,caps:escape";

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound.
sound.enable = true;
security.rtkit.enable = true;
services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
};

#hardware.pulseaudio.enable = true;
hardware.system76.enableAll = true; # uncomment when building nix on system76 hardware.
hardware.bluetooth.enable = true;
services.blueman.enable = true;

security.pam.services.swaylock = {
  text = ''
      auth include login
  '';
};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
users.users.alec = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
};

nix.nixPath = [
  "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos/nixpkgs"
  "nixos-config=/home/alec/.config/nixos/cayley/configuration.nix"
];

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
programs.gnupg.agent = {
  enable = true;
  enableSSHSupport = true;
};

# List services that you want to enable:

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Open ports in the firewall.
networking.firewall.allowedTCPPorts = [ 80 443 22 53317 ];
#networking.firewall.allowedUDPPorts = [];
# Or disable the firewall altogether.
networking.firewall.enable = true;

# Copy the NixOS configuration file and link it from the resulting system
# (/run/current-system/configuration.nix). This is useful in case you
# accidentally delete configuration.nix.
# system.copySystemConfiguration = true;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It's perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
#system.stateVersion = "23.05"; # Did you read the comment?
system.stateVersion = "unstable"; # Did you read the comment?

}
