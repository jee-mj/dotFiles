{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../../hardware-configuration.nix
    ../../package/pkgs.nix
    ./boot.nix
    ./lang.nix
    ./shell.nix
    ./vm.nix
    ./ws.nix
    ./user.nix
  ];

  system.stateVersion = "24.11";
  documentation.nixos.enable = false;
  fonts.fontconfig.cache32Bit = true;
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      trusted-users = [user];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [];
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
    usb-modeswitch.enable = true;
    usbStorage.manageStartStop = true;
  };

  networking = {
    enableIPv6 = true;
    firewall.enable = true;
    networkmanager = {
      enable = true;
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
      jack.enable = true;
      pulse.enable = true;
    };
    ntp.enable = true;
    printing.enable = true;
  };
}
