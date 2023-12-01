{ pkgs, ... }:

let shellAliases = import ../aliasrc.nix;
in {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = false;
    dotDir = ".config";
    defaultKeymap = "viins";
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
        neofetch --config ~/.config/neofetch/config.conf

        bindkey -v

        autoload -U colors && colors
        PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

        eval "$(starship init zsh)" 2>/dev/null # dump errors.

        PATH=$PATH:$HOME/scripts/
        PATH=$PATH:$HOME/scripts/userscripts/
        PATH=$PATH:$HOME/scripts/math

        export KEYTIMEOUT=1

        # Preferred editor for local and remote sessions
        if [[ -n $SSH_CONNECTION ]]; then
          export EDITOR='vim'
        else
          export EDITOR='vim'
        fi

        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

        eval "$(ssh-agent -s)" &>/dev/null # dump output.
        ssh-add $HOME/.ssh/id_github 2>/dev/null

        cd ~
    '';

    inherit shellAliases;
}
