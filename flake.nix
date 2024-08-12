{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      # Keep ``inputs.nixpkgs`` of home-manager consistent with
      # the ``inputs.nixpkgs`` of the current flake and thus avoid
      # problems caused by having different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      # TODO: Remove unnecessary attributes in argument
      inherit (nixpkgs) lib;
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { inherit lib; };
      specialArgs = {
        inherit inputs configVars configLib;
      };
    in {
      nixosConfigurations.testvm = lib.nixosSystem {
	inherit specialArgs;
        system = "x86_64-linux";
        modules = [
	  inputs.home-manager.nixosModules.home-manager
	  inputs.stylix.nixosModules.stylix
	  { home-manager.extraSpecialArgs = specialArgs; }
	  # {
	  #   # home-manager.useGlobalPkgs = true;
	  #   # home-manager.useUserPackages = true;
	  #   # home-manager.users.bhubache = import ./home/default.nix;
	  #   # home-manager.sharedModules = [
	  #   #   inputs.nixvim.homeManagerModules.nixvim
	  #   # ];
	  #   home-manager.extraSpecialArgs = { inherit specialArgs; };
	  # }
	  ./hosts/testvm
        ];
      };
  };
}
