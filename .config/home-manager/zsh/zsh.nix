{ pkgs, ... }:

let shellAliases = import ./aliasrc.nix;
in {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    dotDir = "";
    defaultKeymap = "viins";
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
        neofetch

        autoload -U colors && colors
        PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

        eval "$(starship init zsh)" 2>/dev/null # dump errors.

        PATH=$PATH:/home/alec/scripts/
        PATH=$PATH:/home/alec/scripts/userscripts/
        PATH=$PATH:/home/alec/scripts/math

        export KEYTIMEOUT=1

        eval "$(ssh-agent -s)" &> /dev/null
        ssh-add $HOME/.ssh/id_github &> /dev/null
    '';

    inherit shellAliases;
}
