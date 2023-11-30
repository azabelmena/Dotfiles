{
    dot="/run/current-system/sw/bin/git --git-dir=$HOME --work-tree=$HOME";

    # System
    suspend="systemctl suspend";
    hibernate="systemctl hibernate";

    # Listing
    clear="clear && neofetch --config ~/.config/neofetch/config.conf"; # continue to flex.
    ls="exa";
    bat="bat --theme gruvbox-dark";    # Add bat alternative to less.

    # Fetching programs
    neofetchrc="vim ~/.config/neofetch/config.conf";

    ##vim
    vi="vim";
    rvi="rvim";
    vimrc="vim ~/.vimrc";
    vifmrc="vim ~/.config/vifm/vifmrc";

    ## ZSH
    history="history | less";
    starshiprc="vim ~/.config/starship.toml";
    sourcezsh="source ~/.config/.zshrc";

    ## Kitty terminal
    icat="kitty +kitten icat";

    ## qutebrowser
    quterc="vim ~/.config/qutebrowser/config.py";

    ##Hyprland
    hyprrc="vim ~/.config/hypr/";
    wofirc="vim HOME/.config/wofi/style.css";
    swaylockrc="vim ~/.config/swaylock/config";

    ##dunst
    dunstrc="vim ~/.config/dunst/dunstrc";

    ##TMUX
    tmuxrc="vim ~/.tmux.conf";

    ##zathura
    zathurarc="vim ~/.config/zathura/zathurarc";

    #nixos
    nixrc="vim ~/.config/nix/";
    homerc="vim ~/.config/home-manager/";
    flakerc="vim ~/.config/flake.nix";
}
