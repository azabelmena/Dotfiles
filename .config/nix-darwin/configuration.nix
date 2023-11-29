# Noether NIX!

{inputs, config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
      experimental-features = ["nix-command" "flakes"];
  };

  users.users.alec = {
    name = "alec";
    home = "/Users/alec";
  };
  environment.systemPackages = with pkgs; [
      vim-full
      neofetch
      kitty
      zathura
      vim-full
      vifm
      inkscape
      qbittorrent
      zsh-syntax-highlighting
      zsh-autosuggestions
      gcc
      llvmPackages_15.openmp
      openmpi
      zsh-vi-mode
      inkscape
      qbittorrent
      starship
      texlive.combined.scheme-full
      eza
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nix-darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nix-darwin/configuration.nix";

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;


  nixpkgs.hostPlatform = "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
