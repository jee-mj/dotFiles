{
  lib,
  inputs,
  allUsers,
  config,
  pkgs,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
}: {
  imports = [
    ../../../hardware-configuration.nix
    ./package/pkgs.nix
    ./boot.nix
    ./lang.nix
    ./shell.nix
    ./vm.nix
    ./ws.nix
    ./user.nix
  ];

  system.stateVersion = "24.05";
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"]; 
      auto-optimise-store = true;
      substituters = [];
      trusted-users = [user];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      # Force building the compiler toolchain from source
      allowBootstrapBinaryCaches = false;
      # Use specific configurations that rebuild the bootstrap binaries
      bootstrapPackages = pkgs.rebuild-bootstrap;
    };
  };

  security.rtkit.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    pulseaudio = {
      enable = false;
    };
    usb-modeswitch.enable = false;
    usbStorage.manageStartStop = true;
  };

  networking = {
    # enableIPv6 = true;
    firewall.enable = false;
    networkmanager = {
      enable = false;
      wifi.powersave = false;
    };
  };

  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      # jack.enable = true;
      pulse.enable = true;
    };
    ntp.enable = true;
    # printing.enable = true;
    # xserver.videoDrivers = ["nvidia"];
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";             # Disable root login over SSH
        PasswordAuthentication = false;     # Enforce key-based authentication
      };
    };
  };
}
