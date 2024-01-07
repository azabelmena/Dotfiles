{ pkgs, lib, ... }:
{
  users.nixos = {
    uid = 1000;
    isNormalUser = lib.mkForce false;
    isSystemUser = true;
    hashedPassword = "";
    group = "wheel";
    shell = pkgs.zsh;
    packages = with pkgs; [
      eza
      fastfetch
      lynx
      manix
      neovim
      starship
      tmux
      zsh
    ];
  };
}
