{
  lib,
  inputs,
  system,
  home-manager,
  user,
  allUsers,
  pkgs,
  pkgs-unstable,
  hostnameroot,
  nixos-wsl
}: {
  "${hostnameroot}-LAB" = lib.nixosSystem {
    inherit system;
    modules = [
      {
        hardware.nvidia.open = false;
        hardware.nvidia.prime = {
          amdgpuBusId = "PCI:11:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
        networking.hostName = "${hostnameroot}-LAB";
      }
      # Hardware Configuration START
      inputs.nixos-hardware.nixosModules.common-cpu-amd
      inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
      inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
      inputs.nixos-hardware.nixosModules.common-gpu-nvidia
      # Hardware Configuration END
      ./.lab/sys.nix
      ./.lab/net.nix
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit user;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users = {
            ${user} = {
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
      inputs.vscode-server.nixosModules.default
    ];
    specialArgs = {inherit hostnameroot user inputs pkgs-unstable;};
  };
  "${hostnameroot}-WS" = lib.nixosSystem {
    inherit system;
    modules = [
      {
        environment.systemPackages = [
        ];
        hardware.nvidia.prime = {
          amdgpuBusId = "PCI:11:0:0";
          nvidiaBusId = "PCI:1:0:0";
        };
        networking.hostName = "${hostnameroot}-WS";
      }
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
  "${hostnameroot}-WSL" = lib.nixosSystem {
    inherit system;
    modules = [
      nixos-wsl.nixosModules.default
      {
        networking.hostName = "${hostnameroot}-LAB";
        wsl = {
          enable = true;
          defaultUser = "${user}";
          docker-desktop.enable = true;
          nativeSystemd = true;
          startMenuLaunchers = true;
          useWindowsDriver = true;
          wslConf = {
            automount = {
              enabled = true;
              root = "/mnt";
            };
            interop = {
              appendWindowsPath = true;
              enabled = true;
              includePath = true;
              register = false;
            };
          };
        };
      }
      ./.lab/sys.nix
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit user;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users = {
            ${user} = {
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
      inputs.vscode-server.nixosModules.default
    ];
    specialArgs = {inherit hostnameroot user inputs pkgs-unstable;};
  };
  # Currently not operational
  # 
  # "${hostnameroot}-MBP" = lib.nixosSystem {
  #   inherit system;
  #   modules = [
  #     {
  #       networking.hostName = "${hostnameroot}-MBP";
  #     }
  #     ./.mac/sys.nix
  #     home-manager.nixosModules.home-manager
  #     {
  #       home-manager = {
  #         extraSpecialArgs = {inherit user;};
  #         useGlobalPkgs = true;
  #         useUserPackages = true;
  #         users = {
  #           ${user} = {
  #             imports = [
  #               ../../home/users/${user}.nix
  #             ];
  #             nixpkgs = {
  #               config = {
  #                 allowUnfree = true;
  #               };
  #               hostPlatform = {
  #                 config = "aarch64-apple-darwin";
  #                 system = "aarch64-darwin";
  #               };
  #             };
  #           };
  #         };
  #       };
  #     }
  #   ];
  #   specialArgs = {inherit hostnameroot user inputs;};
  # };
  
  # "${hostnameroot}-SURFACE" = lib.nixosSystem {
  #   inherit system;
  #   modules = [
  #     {
  #       environment.systemPackages = [
  #       ];
  #       networking.hostName = "${hostnameroot}-SURFACE";
  #     }
  #     # Hardware Configuration START
  #     inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
  #     # Hardware Configuration END
  #     ./.nix/sys.nix
  #     ../overlay/discord.nix
  #     inputs.home-manager.nixosModules.home-manager
  #     {
  #       home-manager = {
  #         extraSpecialArgs = {inherit user;};
  #         useGlobalPkgs = true;
  #         useUserPackages = true;
  #         users = {
  #           ${user} = {
  #             dconf.settings = {
  #               "org/virt-manager/virt-manager/connections" = {
  #                 autoconnect = ["qemu:///system"];
  #                 uris = ["qemu:///system"];
  #               };
  #             };
  #             imports = [
  #               ../../home/users/${user}.nix
  #             ];
  #             nixpkgs.config = {
  #               allowUnfree = true;
  #             };
  #           };
  #         };
  #       };
  #     }
  #   ];
  #   specialArgs = {inherit user inputs;};
  # };
}
