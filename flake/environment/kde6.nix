{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  imports = [
    ./desktop.nix
  ];

  i18n.inputMethod.fcitx5.plasma6Support = true;

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
    desktopManager.plasma6.enable = true;
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
    kde-pim = {
      enable = true;
      kontact = true;
      merkuro = true;
    };
    kdeconnect.enable = true;
    partition-manager.enable = true;
    xwayland.enable = true;
  };
}