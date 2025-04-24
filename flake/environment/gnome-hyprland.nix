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
  _class, # musnix?
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
    systemPackages = with pkgs; [
      hyprpaper
      socat
      dconf
      swaylock-effects
      swayidle
      wl-clipboard
      mako
      wlsunset
      grim
      brightnessctl
      swaybg
      slurp
      wlogout
      fuzzel
      wob
      wtype
      wmctrl
      squeekboard
      pavucontrol
      glib # gsettings
      kanshi
      bluetui
      wireplumber
      bluez
    ];
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
    waybar = {
      enable = true;
    };

    hyprland = {
      enable = true;
      withUWSM = true; # recommended for most users
      xwayland.enable = true; # Xwayland can be disabled.
    };
  };

  services = {
    displayManager = {
      defaultSession = "hyprland-uwsm";
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
