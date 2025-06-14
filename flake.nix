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
        
    };

    outputs = { self, nixpkgs, home-manager, hyprpanel, ... }@inputs: {
        nixosConfigurations._highpointe = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

            modules = [
                ./configuration.nix
                home-manager.nixosMOdules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;

                    home-manager.users._reave = import ./home.nix;

                    nixpkgs.overlays = [ hyprpanel.overlay ];
                }
            ];
        };
    };  
}
