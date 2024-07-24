# flake.nix
{
  inputs = {
    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs"; # TODO: remove the `inputs.nixpkgs` bit if possible
    };
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    musnix,
    home-manager,
    alejandra,
    nixos-hardware,
  }: let
    hostnameroot = "URIEL";
    system = "x86_64-linux";
    user = "mj";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in rec {
    nixosConfigurations = (
      import ./flake/system/surface.nix {
        inherit (nixpkgs) lib;
        inherit inputs user system home-manager hostnameroot;
      }
    );
    # Home-Manager Configuration
    hmConfig = {
      vim = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          {
            home.stateVersion = "24.11";
            home.username = "vim";
            home.homeDirectory = "/home/vimv";
            imports = [
              home/user/vim.nix
            ];
          }
        ];
      };
      mj = home-manager.lib.homeManagerConfiguration {
        pkgs= pkgs;
        modules = [
          {
            home.stateVersion = "24.11";
            home.username = user;
            home.homeDirectory = "/home/mj";
            imports = [
              home/user/mj.nix
            ];
          }
        ];
      };
    };
  };
}
