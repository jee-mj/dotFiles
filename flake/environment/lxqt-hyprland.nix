{
  inputs,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
}: {
  imports = [
    ./desktop.nix
  ];

  # System portal and integration services
  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    sounds.enable = true;
    icons.enable = true;
    portal = {
      enable = true;
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [gnome-keyring];
    };
  };

  # Qt platform integration
  qt = {
    enable = true;
    platformTheme = "lxqt";
    style = "kvantum";
  };

  # Security and policy services
  security.polkit.enable = true;

  # KDE specific services
  services = {
    colord.enable = true;
    gnome.gnome-keyring.enable = true;

    # Display manager configuration
    displayManager = {
      defaultSession = "hyprland-uwsm";
      sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = false;
      };
    };
    xserver = {
      desktopManager.lxqt.enable = true;
    };
  };

  # Programs and environment configuration
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true; # recommended for most users
      xwayland.enable = true; # Xwayland can be disabled.
    };
    light.enable = true;
    xwayland.enable = true;

    foot = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        main = {
          font = "0xProto Nerd Font Mono:size=12";
        };
        scrollback = {
          lines = 65535;
        };
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      hyprpaper
      fuzzel
      socat
      dconf
      lua
      wl-clipboard
      mako
      waybar
      wlsunset
      grim
      brightnessctl
      slurp
      wlogout
      wob
      wtype
      wmctrl
      squeekboard
      pwvucontrol
      kanshi
      foot
    ];
    variables = {
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
