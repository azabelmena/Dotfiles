{ config, pkgs, inputs, ... }: #NOETHER NIX!

{
    imports = [
      inputs.nix-colors.homeManagerModules.default
    ];
    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-soft;

    home.stateVersion = "23.11";

    home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CONFIG_HOME = ".config";
    };

    programs.home-manager.enable = true;

    home.packages = with pkgs; [
      (nerdfonts.override { fonts = ["IBMPlexMono"]; })
    ];

    programs = {
      git = {
        enable = true;
        userName = "Alec S. Zabel-Mena";
        userEmail = "alec.zabel@upr.edu";
      };

      bash = (import ./bash/bash-darwin.nix { inherit pkgs; });
      kitty = (import ./kitty/kitty-darwin.nix { inherit pkgs config; });
      starship = ( import ./starship.nix { inherit pkgs config; });
      tmux = (import ./tmux.nix { inherit pkgs; });
      neovim = ( import ./nvim/nvim.nix { inherit pkgs config; } );
      zsh = (import ./zsh/zsh-darwin.nix { inherit pkgs; });
    };

    home.file = {
      ".local/share/zsh/zsh-autosuggestions".source =
      "${pkgs.zsh-autosuggestions}/share/zhs-autosuggestions";

      "nvim" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
        "/Users/alec/.config/home-manager/nvim/lua/";
        target = ".config/nvim/lua/";
      };

      "ultisnips" = {
        recursive = true;
        source = config.lib.file.mkOutOfStoreSymlink
        "/Users/alec/.config/home-manager/nvim/UltiSnips";
        target = ".config/nvim/UltiSnips/";
      };

      "waybar" = {
        source = config.lib.file.mkOutOfStoreSymlink
        "/Users/alec/.config/home-manager/waybar/style.css";
        target = ".config/waybar/style.css";
      };
  };
}
