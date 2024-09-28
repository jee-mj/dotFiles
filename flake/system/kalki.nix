{
  lib,
  pkgs,
  inputs,
  system,
  home-manager,
  user,
  hostnameroot
}: {
  "${hostnameroot}-KALKI" = lib.nixosSystem {
    inherit system;
    modules = [
      {
        environment.systemPackages = [
          pkgs.gns3-server
        ];
        hardware.nvidia.prime = {
          amdgpuBusId = "PCI:11:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
        networking.hostName = "${hostnameroot}-KALKI";
        services.gns3-server = {
          enable = true;
          dynamips.enable = true;
          ubridge.enable = true;
          # ssl.enable = true;
        };
      }
      # Enable Musnix Optimisations
      inputs.musnix.nixosModules.musnix
      # Hardware Configuration START
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
      inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
      inputs.nixos-hardware.nixosModules.common-gpu-nvidia
      # Hardware Configuration END
      ./.nix/sys.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit user;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users = {
            # vim = {
            #   imports = [
            #     ../../home/users/vim.nix
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
