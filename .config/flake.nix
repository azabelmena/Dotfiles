{
  description = "NixOS Configuration for Cayley and Cauchy.";

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:/nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixos";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {self, nixos, nixos-stable, nixpkgs, darwin, home-manager, ...}@inputs:
  let
    system-x86_64-linux = "x86_64-linux";
    system-aarch64-darwin = "aarch64-darwin";

    pkgs-nixos = import nixos { inherit system-x86_64-linux; };
    pkgs-darwin = import nixpkgs { inherit system-aarch64-darwin; };

  in{
    nixosConfigurations = {

      recovery = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          ({ pkgs, ... }: {
            environment.systemPackages = with pkgs; [
              vim-full
              testdisk
              foremost
              git
            ];

            systemd.services.sshd.wantedBy = pkgs.lib.mkForce [ "multi-user.target" ];
            users.users.root.openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMSx69aMu/G7HEqdpe3TGn8q8wDhGMGVEubsK82ijSC1 alec@cayley"
            ];
          })
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

      lovelace = nixos.lib.nixosSystem {
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
