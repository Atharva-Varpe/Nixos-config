{
  description = "Luna's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixcord, spicetify-nix, zen-browser, ... }@inputs: {
    # NixOS system configurations (with integrated home-manager)
    nixosConfigurations = {
      # Main laptop
      Zani = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/Zani/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.luna = import ./home/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [
              nixcord.homeModules.nixcord
              spicetify-nix.homeManagerModules.spicetify
            ];
          }
        ];
      };
    };

    # Standalone home-manager configurations (no sudo required!)
    homeConfigurations = {
      "luna" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/home.nix
          nixcord.homeModules.nixcord
          spicetify-nix.homeManagerModules.spicetify
          # Allow unfree packages (needed for VSCode, Discord, etc.)
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (nixpkgs.lib.getName pkg) [
              "vscode"
              "discord"
              "spotify"
            ];
          }
        ];
      };
    };
  };
}
