{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/.nix/boot.nix
      /etc/nixos/.nix/kde.nix
      /etc/nixos/.nix/zerotier.nix
    ];
    
  system.stateVersion = "23.11";
  
  time = {
    timeZone = "Australia/Sydney";
  };

  nix = {
    settings = {
      # experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "mj" ];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [];
    };
  };

  sound.enable = true;


  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" "amdgpu" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  programs = {
    _1password-gui.enable = true;
    adb.enable = true;
    firefox.enable = true;
    fish.enable = true;
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    gnupg = {
      agent = {
        enableSSHSupport = true;
      };
    };
    nano.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    ssh = {

    };
    steam.enable = true;
    tmux = {
      aggressiveResize = true;
      baseIndex = 1;
    	clock24 = true;
    	enable = true;
      terminal = "xterm-256color";
      keyMode = "vi";
    	plugins = with pkgs.tmuxPlugins; [
        yank
        tmux-fzf
        fuzzback
        tmux-thumbs
        dracula
        tmux-colors-solarized
        continuum
    	];
    };
    virt-manager.enable = true;
    wireshark.enable = true;
    zsh.enable = true;
  };

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