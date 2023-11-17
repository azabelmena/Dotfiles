{pkgs, ...}:

{
    enable = true;

    shellAliases = import ./aliasrc.nix;

    initExtra = ''
      neofetch 2>/dev/null
      set -o vi
      eval "$(starship init bash)" 2>/dev/null
    '';
}
