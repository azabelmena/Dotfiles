{

  description = "Darwin System Configuration for Noether.";

  inputs = {
    nixpkgs = {
      url = "github:/nixos/nixpkgs-unstable";
    };

    home-manager = {
      url = "github:/nix-community/home-manager/master";

      home-manager.inputs.nixpkgs.follows = "nixpkgs";

      darwin = {
        url = "github:/LnL7/nix-darwin";

      darwin.inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = inputs :{
    darwinConfigurations = {
      noether = inputs.darwin.lib.darwinSystem;
      pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
    };

    modules = [
      ({pkgs, ...}: {
        documentation.enable = true;

        programs.zsh.enable = true;
        environment.shells = with pkgs; [
          bash
          zsh
        ];
        environment.loginShell = zsh;

        nix.extraOptions = ''
          experimental-features = nix-command flakes
        '';

        system.keyboard.enableKeyMapping = true;
        system.keyboard.remapCapsLockToControl = true;

        fonts.fontDir.enable = true;
        fonts.fonts = with pkgs; [(nerdfonts.override { fonts = ["IBMPlexMono"]; })];

        services.nix-daemon.enable = true;

        system.defaults.finder.AppleShowAllExtensions = true;
        system.defaults.finder._FXShowPosixPathInTitle = true;
      })

      (inputs.home-manager.darwinModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPkgs = true;

          users.alec.imports = [
            ./home-manager/home.nix
          ];

        };
      })
    ];

  };
}
