{
  config,
  pkgs
}: {
  imports = [
    ./desktop.nix
  ];

  ## System Environment

  environment = {
    gnome.excludePackages =
      (with pkgs; [
        gedit
        gnome-console
        gnome-photos
        gnome-tour
      ])
      ++ (with pkgs.gnome; [
        cheese # webcam tool
        gnome-calculator
        gnome-clocks
        gnome-contacts
        gnome-maps
        gnome-music
        gnome-terminal
        gnome-weather
        yelp # gnome help
        geary # email reader
        evince # document viewer
        totem # video player
        tali # poker game
        iagno # go game
        hitori # sudoku game
        atomix # puzzle game
        # remove contacts, weather, clock, maps, calculator, document scanner,
      ]);
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  udev = {
    packages = with pkgs; [gnome.gnome-settings-daemon];
  };

  services.xserver = {
    enable = true;
    desktopManager = {
      gnome.enable = true;
    };
    displayManager = {
      gdm.enable = true;
    };
  };

  xdg = {
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
