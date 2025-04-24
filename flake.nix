{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/?ref=nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    claude = {
      url = "github:k3d3/claude-desktop-linux-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix = {
      url = "github:musnix/musnix";
    };
    neve = {
      url = "github:jee-mj/Neve?ref=main";
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
    waybar.url = "github:Alexays/Waybar/master";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    nixos-hardware,
    nixos-wsl,
    nix-darwin,
    home-manager,
    vscode-server,
    neve,
    claude,
    musnix,
    waybar,
  }: let
    allUsers = [
      "kalki"
      "mj"
      "vim"
      "root"
    ];
    hostnameroot = "URIEL";
    system = "x86_64-linux";
    user = "kalki";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = import ./flake/system/system.nix {
      inherit (nixpkgs) lib;
      inherit
        inputs
        user
        system
        hostnameroot
        pkgs
        neve
        claude
        waybar
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
              home.stateVersion = "24.11";
              home.username = username;
              home.homeDirectory = "/home/${username}";
              imports = [
                ./home/users/${username}.nix
              ];
            }
          ];
        };
      })
      allUsers
    );
  };
}
