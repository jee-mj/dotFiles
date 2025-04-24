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
    ./kde-apps.nix
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
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
      ];
    };
  };

  # Qt platform integration
  qt = {
    enable = true;
    platformTheme = "kde";
    style = "kvantum";
  };

  security.polkit.enable = true;

  # KDE specific services
  services = {
    colord.enable = true;

    # Display manager configuration
    displayManager = {
      defaultSession = "hyprland-uwsm";
      sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
      };
    };
  };

  # Programs and environment configuration
  programs = {
    light.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    xwayland.enable = true;

    # KDE PIM suite
    kde-pim = {
      enable = true;
      kontact = true;
      merkuro = true;
    };

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

    hyprland = {
      enable = true;
      withUWSM = true; # recommended for most users
      xwayland.enable = true; # Xwayland can be disabled.
    };
  };

  # Input method configuration
  i18n.inputMethod.fcitx5.plasma6Support = true;

  environment.systemPackages = with pkgs; [
    hyprpaper
    fuzzel
    socat
    dconf
    lua
    wl-clipboard
    mako # notification daemon
    waybar
    wlsunset
    imagemagick
    grim
    brightnessctl
    slurp
    wlogout
    wob
    wtype
    wmctrl
    squeekboard
    kanshi
    foot
  ];
  # Additional environment variables for integration
  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
}
