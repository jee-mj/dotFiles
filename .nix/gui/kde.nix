{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./gui.nix
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
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
    sounds.enable = true;
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm.enable = true;
      sddm.wayland.enable = true;
      defaultSession = "plasma";
    };
  };

  programs = {
    kdeconnect.enable = true;
    xwayland.enable = true;
  };
}
