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
}: {
  imports = [
    ./desktop.nix
  ];

  # Enable the gnome-keyring secrets vault.
  # Will be exposed through DBus to programs willing to store secrets.
  services.gnome.gnome-keyring.enable = true;

  programs = {
    light.enable = true;
    # enable sway window manager
    sway = {
      enable = true;
      extraOptions = ["--unsupported-gpu"];
      extraPackages = with pkgs; [grim slurp wl-clipboard fuzzel foot mako dconf swaylock-effects swayidle wlsunset imagemagick brightnessctl swaybg wlogout pwvucontrol glib materia-theme material-icons material-design-icons qogir-theme qogir-icon-theme kanshi wmctrl lua];
      wrapperFeatures.gtk = true;
    };
    waybar.enable = true;
  };

  xdg = {
    autostart.enable = true;
    menus.enable = true;
    mime.enable = true;
    sounds.enable = true;
    portal = {
      wlr.enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [pkgs.gnome-keyring];
    };
  };

  security.polkit.enable = true;
}
