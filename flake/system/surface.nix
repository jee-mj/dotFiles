{
  lib,
  inputs,
  system,
  home-manager,
  user,
  hostnameroot,
  ...
}: {
  "${hostnameroot}-SURFACE" = lib.nixosSystem {
    inherit system;
    modules = [
      {
        environment.systemPackages = [
          inputs.alejandra.defaultPackage."x86_64-linux"
        ];
      }
      inputs.musnix.nixosModules.musnix
      inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
      ./.nix/sys.nix
      ../overlay/discord.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit user;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users = {
            # vim = {
            #   imports = [
            #     ../../home/user/vim.nix
            #   ];
            #   nixpkgs.config.allowUnfree = true;
            # }; # bash_mcFly is going to give you grief; unless you are a bash user
            ${user} = {
              dconf.settings = {
                "org/virt-manager/virt-manager/connections" = {
                  autoconnect = ["qemu:///system"];
                  uris = ["qemu:///system"];
                };
              };
              imports = [
                ../../home/users/${user}.nix
              ];
              nixpkgs.config = {
                allowUnfree = true;
              };
            };
          };
        };
      }
    ];
    specialArgs = {inherit user inputs;};
  };
}
