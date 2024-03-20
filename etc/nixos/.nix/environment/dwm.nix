{ config, pkgs, user ... }:
let
  baseApps = import /etc/nixos/.nix/pkgs/appsBase.nix { inherit pkgs; };
  networkApps = import /etc/nixos/.nix/pkgs/appsNetwork.nix { inherit pkgs; };
  shellApps = import /etc/nixos/.nix/pkgs/appsShell.nix { inherit pkgs; };
  userApps = import /etc/nixos/.nix/pkgs/appsUser.nix { inherit pkgs; };
  devApps = import /etc/nixos/.nix/pkgs/appsCoder.nix { inherit pkgs; };
  dwm = import /etc/nixos/.nix/pkgs/appsDwm.nix { inherit pkgs; };
in
{


  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
        serif = ["Noto Serif" "Source Han Serif"];
        sansSerif = ["Noto Sans" "Source Han Sans"];
      };
    };
  };

  ## System Environment

  environment = {
    systemPackages =
      shellApps   ++
      baseApps    ++
      networkApps ++ dwm;
  };

  ## Users

  users = {
    users = {
      root = {
        shell = pkgs.fish;
        };
      mj = {
        group = "users";
        isNormalUser = true;
        description = "vimv";
        extraGroups = [ "networkmanager" "wheel" "podman" "mysql" "flatpak" "libvirtd" "audio" "video" "disk" "qemu" "kvm" "sshd" ];
        shell = pkgs.fish;
        packages = userApps ++ devApps;
      };
    };
  };

  xdg = {
    icons.enable = true;
    menus.enable = true;
    mime.enable = true;
    portal = {
      enable = true;
      config.common.default = "*";
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
    sounds.enable = true;
  };

  services = {
    dbus.enable = true;
    picom.enable = true;
    xserver = {
      windowManager.dwm.enable = true;
      displayManager = {
        lightdm.enable = true;
        setupCommands = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --output DP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal
        '';
      };
    };
  };
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = ["graphical-session.target"];
      wants = ["graphical-session.target"];
      after = ["graphical-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
