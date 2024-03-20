{ config, pkgs, ... }:
let
  baseApps = import /etc/nixos/.nix/pkgs/appsBase.nix { inherit pkgs; };
  networkApps = import /etc/nixos/.nix/pkgs/appsNetwork.nix { inherit pkgs; };
  shellApps = import /etc/nixos/.nix/pkgs/appsShell.nix { inherit pkgs; };
  userApps = import /etc/nixos/.nix/pkgs/appsUser.nix { inherit pkgs; };
  devApps = import /etc/nixos/.nix/pkgs/appsCoder.nix { inherit pkgs; };
  gnome = import /etc/nixos/.nix/pkgs/appsGnome.nix { inherit pkgs; };
in
{
  ## System Environment

  environment = {
    gnome.excludePackages = (with pkgs; [
      gedit 
      gnome-console
      gnome-photos
      gnome-tour
    ]) ++ (with pkgs.gnome; [
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
    systemPackages =
      shellApps   ++
      baseApps    ++
      networkApps ++ gnome;
    sessionVariables.NIXOS_OZONE_WL = "1";
  };

  udev = {
    packages = with pkgs; [gnome.gnome-settings-daemon];
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
        extraGroups = [ "networkmanager" "wheel" "podman" "mysql" ];
        shell = pkgs.fish;
        packages = userApps ++ devApps;
      };
    };
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

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
