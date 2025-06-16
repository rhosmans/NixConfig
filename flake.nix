{
    description = "NixOS config";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        hyprpanel = {
            url = "github:Jas-SinghFSU/HyprPanel";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        swww = {
            url = "github:LGFae/swww";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, hyprpanel, swww, ... }@inputs: {
        nixosConfigurations.highpointe = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    # home-manager settings
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    # home-manager user file
                    home-manager.users.reave = import ./home.nix;

                    nixpkgs.overlays = [ hyprpanel.overlay ];
                }
            ];
        };
    };  
}
