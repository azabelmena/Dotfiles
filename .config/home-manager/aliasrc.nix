{

    dot="/run/current-system/sw/bin/git --git-dir=$HOME --work-tree=$HOME";
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
    zshrc="vim $HOME/.zshrc";
    starshiprc="vim $HOME/.config/starship.toml";
    sourcezsh="source $HOME/.zshrc";

    ## Kitty terminal
    icat="kitty +kitten icat";
    kittyrc="vim $HOME/.config/kitty/kitty.conf";

    ## qutebrowser
    quterc="vim $HOME/.config/qutebrowser/config.py";

    ##Hyprland
    hyprlandrc="vim HOME/.config/hypr/";
    waybarrc="vim HOME/.config/waybar/config.jsonc";
    wofirc="vim HOME/.config/wofi/style.css";
    swaylockrc="vim $HOME/.config/swaylock/config";
    hyprpaperrc="vim $HOME/.config/hypr/hyprpaper.conf";

    ##dunst
    dunstrc="vim $HOME/.config/dunst/dunstrc";

    ##TMUX
    tmuxrc="vim $HOME/.tmux.conf";

    ##zathura
    zathurarc="vim $HOME/.config/zathura/zathurarc";

    #nixos
    nixrc="vim $HOME/.config/nixos/";
    homerc="vim $HOME/.config/home-manager/";
}
