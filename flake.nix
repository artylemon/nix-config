{
  description = "Laptop NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux"; # Change if laptop is ARM
      specialArgs = { inherit self; };
      
      modules = [ 
        ./hosts/nixos/configuration.nix

	home-manager.nixosModules.home-manager 
	{
	  home-manager.users.arty = {
	    imports = [ ./users/arty/home.nix ];
	    _module.specialArgs = {inherit self; };
	  };
	}
      ];
    };
  };
}
