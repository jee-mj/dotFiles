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
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    xserver = {
      desktopManager.plasma5.enable = true;
      enable = true;
      videoDrivers = [ "nvidia" "amdgpu" ];
      xkb = {
	layout = "us";
	variant = "";
      };

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
      enable = true;
      polkitPolicyOwners = [ "mj" ];
    };
    adb.enable = true;
    chromium = {
      enable = true;
      homepageLocation = "https://jee-mj.github.io/portfolio";
    };
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
    fish = {
      enable = true;
    };
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    kdeconnect.enable = true;
    mtr = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    virt-manager.enable = true;
    wireshark.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      ohMyZsh.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
