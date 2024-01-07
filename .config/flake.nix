{
  description = "NixOS Configuration for Cayley and Cauchy.";

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/release-23.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager-stable.url = "github:nix-community/home-manager/release-23.11";

    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {self, nixos, nixos-stable, nixpkgs, nixpkgs-stable, darwin, home-manager, home-manager-stable, ...}@inputs:
  let
    system-x86_64-linux = "x86_64-linux";
    system-aarch64-darwin = "aarch64-darwin";

    pkgs-nixos = import nixos { inherit system-x86_64-linux; };
    pkgs-darwin = import nixpkgs { inherit system-aarch64-darwin; };

  in{
    nixosConfigurations = {

      fermat = nixos-stable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixos-stable}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ./nix/fermat/configuration.nix
        ];
      };

      cayley = nixos.lib.nixosSystem {
        specialArgs = { inherit inputs system-x86_64-linux; };

        modules = [
          ./nix/cayley/configuration.nix
        ];
      };

      cauchy = nixos.lib.nixosSystem {
        specialArgs = { inherit inputs system-x86_64-linux; };

        modules = [
          ./nix/cauchy/configuration.nix
        ];
      };

      lovelace = nixos-stable.lib.nixosSystem {
        specialArgs = { inherit inputs system-x86_64-linux; };

        modules = [
          ./nix/lovelace/configuration.nix
        ];
      };

    };

    darwinConfigurations = {

      noether = darwin.lib.darwinSystem{
        modules = [
          ./nix/noether/configuration.nix

          home-manager.darwinModules.home-manager{
            home-manager.extraSpecialArgs = { inherit inputs system-aarch64-darwin; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alec = import ./home-manager/noether.nix;
          }
        ];
      };

    };

  };
}
