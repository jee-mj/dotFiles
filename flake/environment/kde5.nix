{
  config,
  lib,
  pkgs
}: {
  imports = [
    ./desktop.nix
  ];

  qt = {
    enable = true;
    platformTheme = "kde";
  };

  xdg = {
    icons.enable = true;
    menus.enable = true;
    mime.enable = true;
    portal = {
      enable = true;
      # gtkUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
    sounds.enable = true;
  };

  services = {
    xserver.desktopManager.plasma5.enable = true;
    displayManager = {
      sddm = {
        autoNumlock = true;
        enable = true;
        wayland.enable = true;
      };
      defaultSession = "plasma";
    };
  };

  programs = {
    kdeconnect.enable = true;
    xwayland.enable = true;
  };
}
