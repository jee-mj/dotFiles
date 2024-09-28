{
  lib,
  inputs,
  allUsers,
  config,
  pkgs,
  pkgs-unstable,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
}: {
  imports = [
    ./package/pkgs.nix
    ./lang.nix
    ./shell.nix
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
    pulseaudio = {
      enable = false;
    };
  };

  networking = {
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
      pulse.enable = true;
    };
  };
}
