{pkgs, ...}:

let shellAliases = import ../aliases/aliasrc.nix;
in{
    enable = true;

    initExtra = ''
      fastfetch --logo pop_os 2> /dev/null
      set -o vi
      eval "$(starship init bash)" 2>/dev/null
    '';

    inherit shellAliases;
}
