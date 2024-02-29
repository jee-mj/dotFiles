{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/.nix/boot.nix
      /etc/nixos/.nix/kde.nix
      /etc/nixos/.nix/zerotier.nix
    ];
    
  system.stateVersion = "unstable";
  
  time = {
    timeZone = "Australia/Sydney";
  };

  nix.settings.trusted-users = [ "mj" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [];

  sound.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    cpu = {
      amd = {
      sev.enable = true;
      sevGuest.enable = true;
    };
    x86.msr = {
      enable = true;
    };
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    pulseaudio = {
      enable = false;
    };
    usb-modeswitch.enable = true;
    usbStorage.manageStartStop = true;
  };

  virtualisation = {
    docker = {
      enable = false;
      enableNvidia = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    podman = {
      enable = true;
      dockerSocket = {
        enable = true;
      };
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };

  networking = {
    enableIPv6 = true;
    firewall.enable = true;
    hostName = "URIEL";
    networkmanager.enable = true;
  };
}