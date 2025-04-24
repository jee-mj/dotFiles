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

  ## System Environment

  environment = {
    gnome.excludePackages = with pkgs; [
      gedit
      gnome-calculator
      gnome-console
      gnome-clocks
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-terminal
      gnome-weather
      gnome-photos
      gnome-tour
      cheese # webcam tool
      yelp # gnome help
      geary # email reader
      evince # document viewer
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
    ];
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  # udev = {
  #   packages = with pkgs; [gnome.gnome-settings-daemon];
  # };

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
    sway = {
      enable = true;
      extraOptions = ["--unsupported-gpu"];
      extraPackages = with pkgs; [
        grim
        slurp
        wl-clipboard
        fuzzel
        foot
        mako
        dconf
        swaylock-effects
        swayidle wlsunset 
        imagemagick
        brightnessctl
        wireplumber
        swaybg 
        wlogout pwvucontrol glib materia-theme material-icons material-design-icons qogir-theme qogir-icon-theme kanshi wmctrl lua
      ];
      wrapperFeatures.gtk = true;
    };
    waybar.enable = true;
  };

  services = {
    displayManager = {
      defaultSession = "sway";
    };
    xserver = {
      enable = true;
      desktopManager = {
        gnome.enable = true;
      };
      displayManager = {
        gdm.enable = true;
      };
    };
  };

  xdg = {
    autostart.enable = true;
    icons.enable = true;
    menus.enable = true;
    mime.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
      ];
    };
    sounds.enable = true;
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
