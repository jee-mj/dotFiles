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

  programs.hyprland = {
    enable = true;
    withUWSM = true; # recommended for most users
    xwayland.enable = true; # Xwayland can be disabled.
  };

  # programs.zsh.enable = true;
  # programs.zsh.envExtra = ''
  #   export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
  #   export QT_AUTO_SCREEN_SCALE_FACTOR="0"
  #   export QT_SCALE_FACTOR="2"
  #   export GDK_SCALE="2"
  #   export GDK_DPI_SCALE="2"
  #   export GIO_EXTRA_MODULES="${pkgs.dconf.lib}/lib/gio/modules"
  # '';
  # home.sessionVariables = {
  #   XDG_SESSION_TYPE = "wayland";
  #   XDG_CURRENT_DESKTOP = "Hyprland";
  #   QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  #   QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  #   QT_SCALE_FACTOR = "1";
  #   GDK_SCALE = "1";
  #   GDK_DPI_SCALE = "1";
  #   MOZ_ENABLE_WAYLAND = "1";
  #   _JAVA_AWT_WM_NONREPARENTING = "1";
  #   UNIQUEDING = "1";
  #   GIO_EXTRA_MODULES = "${pkgs.dconf.lib}/lib/gio/modules";
  #   GIO_EXTRA_MODULES_A = "1";
  # };

  environment.systemPackages = with pkgs; [
    hyprpaper
    fuzzel
    eww
    socat
    dconf
    lua
    swaylock-effects
    swayidle
    wl-clipboard
    mako # notification daemon
    waybar
    wlsunset
    imagemagick
    grim
    brightnessctl
    swaybg
    slurp
    wlogout
    fuzzel
    wob
    wtype
    wmctrl
    squeekboard
    pavucontrol
    materia-theme
    material-icons
    material-design-icons
    qogir-theme
    qogir-icon-theme
    glib # gsettings
    kanshi
    foot
  ];

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
