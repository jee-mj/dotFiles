{ config, pkgs, ... }:
{
  qt.enable = true;

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
    xserver = {
      desktopManager.plasma5.enable = true;
      displayManager = {
        autoLogin = {
          enable = true;
          user = "guest";
        };
        sddm.enable = true;
      };
    };
  };
  programs = {
    _1password-gui = {
      polkitPolicyOwners = [ "mj" ];
    };
    firefox = {
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
    gnupg = {
      agent = {
        enable = true;
      };
    };
    kdeconnect.enable = true;
    mtr = {
      enable = true;
    };
  };

}

