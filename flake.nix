{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neve = {
      url = "github:jee-mj/Neve?ref=testing";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
    vscode-server = {
      url = "github:nix-community/nixos-vscode-server";
    };
  };
  outputs =
    inputs@{
      self, nixpkgs,
      nixos-hardware,
      nixos-wsl,
      nix-darwin,
      home-manager,
      vscode-server,
      neve,
    }:
    let
      allUsers = [
        "mj"
        "vim"
#        "kalki"
        "root"
      ];
      hostnameroot = "URIEL";
      system = "x86_64-linux";
      user = "mj";
      pkgs = import nixpkgs {
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
          neve
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
