{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      nix-darwin,
      home-manager,
      nixos-hardware,
      nixos-wsl
    }:
    let
      allUsers = [
        "mj"
        "vim"
        "kalki"
        "root"
      ];
      hostnameroot = "URIEL";
      system = "x86_64-linux";
      user = "mj";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    rec {
      nixosConfigurations = import ./flake/system/system.nix {
        inherit (nixpkgs) lib;
        inherit
          inputs
          allUsers
          user
          system
          home-manager
          hostnameroot
          pkgs
          pkgs-unstable
          nixos-wsl
          nixos-hardware
          ;
      };

      # Home-Manager Configuration
      homeConfigurations = builtins.listToAttrs (
        builtins.map (username: {
          name = username;
          value = home-manager.lib.homeManagerConfiguration {
            pkgs = pkgs;
            modules = [
              {
                home.stateVersion = "24.05";
                home.username = username;
                home.homeDirectory = "/home/${username}";
                imports = [
                  ./home/users/${username}.nix
                ];
              }
            ];
          };
        }) allUsers
      );
    };
}