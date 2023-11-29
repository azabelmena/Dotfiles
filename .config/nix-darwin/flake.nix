{
  description = "Darwin System Configuration for Noether.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:/nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, darwin, home-manager, ...}@inputs:
  let

    system = "aarch64-darwin";
    pkgs = import nixpkgs { inherit system; };

  in{
    darwinConfigurations = {
      noether = inputs.darwin.lib.darwinSystem{

        modules = [
          ./configuration.nix

          home-manager.darwinModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alec = import ./home.nix;
          }
        ];

      };
    };
  };
}
