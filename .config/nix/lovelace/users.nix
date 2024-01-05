{ pkgs, ... }:
{

  users.turing = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      fastfetch
      kitty
      manix
      neovim
      lynx
      starship
      tmux
      zsh
    ];
  };
}
