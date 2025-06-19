{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/hyprland?ref=v0.36.0";
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel/master";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprpanel, swww, zen-browser, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ hyprpanel.overlay ];
    };
  in {
    nixosConfigurations.highpointe = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.sharedModules = [
                inputs.hyprpanel.homeManagerModules.hyprpanel
                inputs.zen-browser.homeModules.default
            ];
            
            home-manager.users.reave = import ./home.nix;
        }
      ];
    };
  };
}
