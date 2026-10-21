{
  description = "Laptop NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Tracking the "cachix" branch (rather than following our own nixpkgs)
    # keeps us on commits that noctalia.cachix.org actually has binaries for,
    # so noctalia/quickshell don't get compiled from source locally.
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Change if laptop is ARM
      specialArgs = { inherit self inputs; };

      modules = [
        ./hosts/nixos/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = { inherit self inputs; };
          home-manager.users.arty = {
            imports = [ ./users/arty/home.nix ];
          };
        }
      ];
    };
  };
}
