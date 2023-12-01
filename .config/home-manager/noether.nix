{ config, pkgs, inputs, lib, ... }:

{
    home.stateVersion = "23.11";

    home.sessionVariables = {
        EDITOR = "vim";
        XDG_CONFIG_HOME = ".config";
    };

    programs.home-manager.enable = true;

    home.packages = [
        # Fonts
        (pkgs.nerdfonts.override { fonts = ["IBMPlexMono"]; })
    ];

    programs = {
        git = {
            enable = true;
            userName = "Alec S. Zabel-Mena";
            userEmail = "alec.zabel@upr.edu";
        };

        bash = (import ./bash.nix { inherit pkgs; });
        zsh = (import ./zsh/zsh-darwin.nix { inherit pkgs; });
        tmux = (import ./tmux.nix { inherit pkgs; });
        kitty = (import ./kitty/kitty-darwin.nix { inherit pkgs; });
        zathura = (import ./zathura.nix { inherit pkgs; });
        #yabai = (import ./yabai.nix { inherit pkgs; });
        #skhd = (import ./skhd.nix { inherit pkgs; });
};

    home.file = {
        ".local/share/zsh/zsh-autosuggestions".source =
        "${pkgs.zsh-autosuggestions}/share/zhs-autosuggestions";
    };
}
