{ config, pkgs, ... }:
let
  baseApps = import /etc/nixos/.nix/pkgs/appsBase.nix { inherit pkgs; };
  networkApps = import /etc/nixos/.nix/pkgs/appsNetwork.nix { inherit pkgs; };
  shellApps = import /etc/nixos/.nix/pkgs/appsShell.nix { inherit pkgs; };
  userApps = import /etc/nixos/.nix/pkgs/appsUser.nix { inherit pkgs; };
  devApps = import /etc/nixos/.nix/pkgs/appsCoder.nix { inherit pkgs; };
  kde = import /etc/nixos/.nix/pkgs/appsKde.nix { inherit pkgs; };
in
{
  ## System Environment

  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
    ];
    systemPackages =
      shellApps   ++
      baseApps    ++
      networkApps ++ kde;
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
        extraGroups = [ "networkmanager" "wheel" "podman" "mysql" "libvirtd" "audio" "video" "disk" "qemu" "kvm" "sshd" ];
        shell = pkgs.fish;
        packages = userApps ++ devApps;
      };
    };
  };
  qt.enable = true;

  xdg = {
    icons.enable = true;
    menus.enable = true;
    mime.enable = true;
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };
    sounds.enable = true;
  };

  services = {
    xserver = {
      desktopManager.plasma5.enable = true;
      displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = false;
      };
    };
  };
  programs = {
    kdeconnect.enable = true;
    xwayland.enable = false;
  };
}
