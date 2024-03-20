{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/.nix/boot.nix
      /etc/nixos/.nix/lamp.nix
      /etc/nixos/.nix/zerotier.nix
      /etc/nixos/.nix/hardware/cpu-amd.nix
      /etc/nixos/.nix/hardware/gpu-nvidia.nix
    ];
    
  system.stateVersion = "23.11";
  documentation.nixos.enable = false;
  fonts.fontconfig.cache32Bit = true;
  
  time = {
    timeZone = "Australia/Sydney";
  };
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes"];
      auto-optimise-store = true;
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

  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ "mj" ];
    };
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
    fish.enable = true;
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    mtr = {
      enable = true;
    };
    nano.enable = false;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
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
        gruvbox
        continuum
      ];
    };
  };

  security.rtkit.enable = true;
  services = {
    flatpak.enable = true;
    ntp.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    xserver = {
      displayManager = {
        autoLogin = {
          enable = true;
          user = "mj";
        };
      };
      enable = true;
      xkb = {
        layout = "au";
        variant = "";
      };
    };
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
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
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
}
