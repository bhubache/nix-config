{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # Keep ``inputs.nixpkgs`` of home-manager consistent with
      # the ``inputs.nixpkgs`` of the current flake and thus avoid
      # problems caused by having different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    stylix.url = "github:nix-community/stylix/release-26.05";

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    obsidian-extensions = {
      url = "github:karaolidis/nix-obsidian-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgsUnstable, nixos-generators, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      pkgsUnstable = import nixpkgsUnstable {
        inherit system;
      };
      # TODO: Remove unnecessary attributes in argument
      inherit (nixpkgs) lib;
      configVars = import ./vars { inherit inputs lib; };
      configLib = import ./lib { inherit lib; };
      specialArgs = {
        inherit inputs configVars configLib pkgsUnstable;
      };
      sharedModules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.stylix.nixosModules.stylix
        # { nixpkgs.overlays = [ inputs.obsidian-extensions.overlays.default ]; }
        {
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.sharedModules = [
            { nixpkgs.overlays = [ inputs.obsidian-extensions.overlays.default ]; }
          ];
        }
      ];
    in {
      nixosConfigurations.desktop = lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = sharedModules ++ [
	  ./hosts/desktop
        ];
      };
      nixosConfigurations.testvm = lib.nixosSystem {
	inherit specialArgs;
        system = "x86_64-linux";
        modules = sharedModules ++ [
	  ./hosts/testvm
        ];
      };

      nixosConfigurations.laptop = lib.nixosSystem {
	inherit specialArgs;
        system = "x86_64-linux";
        modules = sharedModules ++ [
	  ./hosts/laptop
        ];
      };
  };
}
