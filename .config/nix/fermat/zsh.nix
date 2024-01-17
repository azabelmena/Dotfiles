{ pkgs, ... }:

let shellAliases = import ../../home-manager/aliasrc.nix;
in
{
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
        sleep 0.1
        fastfetch

        bindkey -v

        autoload -U colors && colors
        PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

        export KEYTIMEOUT=1
    '';

    inherit shellAliases;
}
