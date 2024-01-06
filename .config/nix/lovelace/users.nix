{ pkgs, ... }:
{

  users.turing = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$Tni9qXs20vyC70hXpLOol.$wCUnWEIjNHfkrfdJCYPrdPNtb7nWUPCOJIkkgmkalW4";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      eza
      fastfetch
      kitty
      lynx
      manix
      neovim
      starship
      tmux
      zsh
    ];
  };

  openssh = {
    autrorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPF3kIluoKiCX45C1uIkp6axm5TSXvnj3ziu+hXjBF0U alec@cayley"
    ];
  };

}
