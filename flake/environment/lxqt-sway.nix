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
      extraPortals = with pkgs; [
        gnome-keyring
        xdg-desktop-portal-wlr
      ];
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
      defaultSession = "sway";
      sddm = {
        enable = true;
        theme = "slick";
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

    # Sway configuration
    sway = {
      enable = true;
      extraOptions = ["--unsupported-gpu"];
      extraPackages = with pkgs; [
        # Sway core dependencies
        grim
        slurp
        wl-clipboard
        fuzzel
        rofi-wayland
        foot
        mako
        dconf
        swaylock-effects
        swayidle
        wlsunset
        brightnessctl
        swaybg
        wlogout
        pwvucontrol

        bluetui
        wireplumber
        bluez



        # LXQT
        lxqt.lxqt-wayland-session

      ];
      wrapperFeatures.gtk = true;
    };

    waybar.enable = true;
  };

  hardware.nvidia.modesetting.enable = true;

  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
}
