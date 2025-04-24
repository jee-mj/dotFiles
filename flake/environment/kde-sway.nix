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
        gnome-keyring
        xdg-desktop-portal-wlr
        kdePackages.xdg-desktop-portal-kde
      ];
    };
  };

  # Qt platform integration
  qt = {
    enable = true;
    platformTheme = "kde";
    style = "breeze";
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
        foot
        mako
        dconf
        swaylock-effects
        swayidle
        wlsunset
        imagemagick
        brightnessctl
        swaybg
        wlogout
        pwvucontrol

        # Integration dependencies
        glib
        materia-theme
        material-icons
        material-design-icons
        qogir-theme
        qogir-icon-theme
        kanshi
        wmctrl
        lua

        # KDE core applications for Sway integration
        kdePackages.dolphin
        kdePackages.konsole
        kdePackages.plasma-integration
        kdePackages.baloo
        kdePackages.breeze
        kdePackages.breeze-gtk
        kdePackages.kscreen
        kdePackages.kded
        kdePackages.kglobalaccel
        kdePackages.kwin
        kdePackages.kdialog
      ];
      wrapperFeatures.gtk = true;
    };

    waybar = {
      enable = true;
      package = pkgs.waybar_git;
    };
  };

  # Input method configuration
  i18n.inputMethod.fcitx5.plasma6Support = true;

  # Additional environment variables for integration
  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    GDK_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
  };
}
