{pkgs, ...}:

let shellAliases = import ../aliases/aliasrc-darwin.nix;
in{
    enable = true;

    initExtra = ''
      fastfetch --logo macos 2> /dev/null
      set -o vi
      eval "$(starship init bash)" 2>/dev/null
    '';

    inherit shellAliases;
}
