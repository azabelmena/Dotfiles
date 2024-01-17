{ pkgs, lib, ... }:
{
  users.nixos = {
    isNormalUser = true;
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
