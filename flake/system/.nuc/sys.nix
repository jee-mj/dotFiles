{
  inputs, allUsers,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
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
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    pulseaudio = {
      enable = false;
    };
    usb-modeswitch.enable = false;
    usbStorage.manageStartStop = true;
  };

  networking = {
    # enableIPv6 = true;
    firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
  };

  services = {
    pipewire = {
      enable = false;
      alsa = {
        enable = false;
        support32Bit = false;
      };
      pulse.enable = false;
    };
    ntp.enable = true;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
    vscode-server.enable = true;
  };
}
