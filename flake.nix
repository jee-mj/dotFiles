# flake.nix
{
  inputs = {
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
  };

  outputs = inputs: rec {
    nixosConfigurations.URIEL-WS = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        inputs.musnix.nixosModules.musnix
        ./.nix/sys.nix
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.users.vim = {
            imports = [
              .flake/user/vim.nix
            ];
            nixpkgs.config.allowUnfree = true;
          };
          home-manager.users.mj = {
            imports = [
              .flake/user/mj.nix
            ];
            nixpkgs.config.allowUnfree = true;
          };
        }
      ];
      specialArgs = {inherit inputs;};
    };
  };
}
