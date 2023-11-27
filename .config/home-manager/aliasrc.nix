{
    dot="/run/current-system/sw/bin/git --git-dir=$HOME --work-tree=$HOME";

    # System
    suspend="systemctl suspend";
    hibernate="systemctl hibernate";

    # Listing
    clear="clear && neofetch";         # continue to flex.
    ls="exa";
    bat="bat --theme gruvbox-dark";    # Add bat alternative to less.

    # Fetching programs
    neofetchrc="vim $HOME/.config/neofetch/config.conf";

    ##vim
    vi="vim";
    rvi="rvim";
    vimrc="vim $HOME/.vimrc";
    vifmrc="vim $HOME/.config/vifm/vifmrc";

    ## ZSH
    history="history | less";
    starshiprc="vim $HOME/.config/starship.toml";
    sourcezsh="source $HOME/.config/.zshrc";

    ## Kitty terminal
    icat="kitty +kitten icat";

    ## qutebrowser
    quterc="vim $HOME/.config/qutebrowser/config.py";

    ##Hyprland
    hyprrc="vim $HOME/.config/hypr/";
    wofirc="vim HOME/.config/wofi/style.css";
    swaylockrc="vim $HOME/.config/swaylock/config";

    ##dunst
    dunstrc="vim $HOME/.config/dunst/dunstrc";

    ##TMUX
    tmuxrc="vim $HOME/.tmux.conf";

    ##zathura
    zathurarc="vim $HOME/.config/zathura/zathurarc";

    #nixos
    nixrc="vim $HOME/.config/nixos/";
    homerc="vim $HOME/.config/home-manager/";
    flakerc="vim $HOME/.config/flake.nix";
}
