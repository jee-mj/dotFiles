{
  lib,
  inputs,
  system,
  home-manager,
  user,
  hostnameroot,
  ...
}: {
  "${hostnameroot}-WS" = lib.nixosSystem {
    inherit system;
    modules = [
      {
        environment.systemPackages = [
          inputs.alejandra.defaultPackage."x86_64-linux"
        ];
        hardware.nvidia.prime = {
          amdgpuBusId = "PCI:11:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
        networking.hostName = "${hostnameroot}-WS";
      }
      inputs.musnix.nixosModules.musnix
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
      inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
      inputs.nixos-hardware.nixosModules.common-gpu-nvidia
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
    specialArgs = {inherit hostnameroot user inputs;};
  };
}
