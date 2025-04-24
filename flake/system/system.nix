{
  lib,
  inputs,
  system,
  user,
  neve,
  claude,
  waybar,
  pkgs,
  hostnameroot,
}: {
  "${hostnameroot}-LAB" = lib.nixosSystem {
    inherit system;
    modules = [
      inputs.musnix.nixosModules.musnix
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
      ../environment/update.nix
      ./private/ssh.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit user;};
          useGlobalPkgs = true;
          useUserPackages = true;
          users = {
            mj = {
              imports = [
                ../../home/users/mj.nix
              ];
            };
            kalki = {
              imports = [
                ../../home/users/kalki.nix
              ];
            };
            vim = {
              imports = [
                ../../home/users/vim.nix
              ];
            };
          };
        };
      }
      inputs.vscode-server.nixosModules.default
      {
        environment.systemPackages = [
          inputs.neve.packages.${pkgs.system}.default
          inputs.claude.packages.${system}.claude-desktop-with-fhs
        ];
      }
      ({pkgs, ...}: {
        nixpkgs.overlays = [
          (_: _: {waybar_git = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar;})
        ];
      })
    ];
    specialArgs = {inherit hostnameroot user inputs;};
  };
  "${hostnameroot}-WS" = lib.nixosSystem {
    inherit system;
    modules = [
      inputs.musnix.nixosModules.musnix
      {
        environment.systemPackages = [
        ];
        hardware.nvidia.open = false;
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
      inputs.nixos-wsl.nixosModules.default
      {
        networking.hostName = "${hostnameroot}-WSL";
        wsl = {
          enable = true;
          defaultUser = "mj";
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
            };
          };
          interop = {
            includePath = true;
            register = false;
          };
        };
      }
      ./.wsl/sys.nix
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager = {
          extraSpecialArgs = {inherit user;};
          # useGlobalPkgs = true;
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

      {
        environment.systemPackages = with pkgs; [
          inputs.neve.packages.${pkgs.system}.default
        ];
      }
    ];
    specialArgs = {inherit hostnameroot user inputs;};
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
  #     nixos-hardware.nixosModules.microsoft-surface-pro-intel
  #     # Hardware Configuration END
  #     ./.nix/sys.nix
  #     ../overlay/discord.nix
  #     home-manager.nixosModules.home-manager
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
