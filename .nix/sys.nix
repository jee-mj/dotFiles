{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../hardware-configuration.nix
    ./hardware/cpu-amd.nix
    ./hardware/gpu-nvidia.nix
    ./gui/kde.nix
    ./pkgs/pkgs.nix
    ./boot.nix
    ./lang.nix
    ./shell.nix
    ./vm.nix
    ./ws.nix
    ./user.nix
  ];

  system.stateVersion = "24.05";
  documentation.nixos.enable = false;
  fonts.fontconfig.cache32Bit = true;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = ["mj"];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [];
    };
  };

  security.rtkit.enable = true;
  sound.enable = true;

  hardware = {
    pulseaudio = {
      enable = false;
    };
    usb-modeswitch.enable = true;
    usbStorage.manageStartStop = true;
  };

  networking = {
    enableIPv6 = true;
    firewall.enable = true;
    hostName = "URIEL-WS";
    networkmanager.enable = true;
  };

  services = {
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
      pulse.enable = true;
    };
    ntp.enable = true;
    printing.enable = true;
  };
}
