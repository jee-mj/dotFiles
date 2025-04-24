{
  user,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
  nixosConfig,
  osConfig,
  _class, # musnix?
}: {
  programs = {
    hyprlock = {
      enable = true;
      extraConfig = "";
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 300;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "screenshot";
            blur_passes = 3;
            blur_size = 8;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, -80";
            monitor = "";
            dots_center = true;
            fade_on_empty = false;
            font_color = "rgb(202, 211, 245)";
            inner_color = "rgb(91, 96, 120)";
            outer_color = "rgb(24, 25, 38)";
            outline_thickness = 5;
            shadow_passes = 2;
          }
        ];
      };
      sourceFirst = true;
    };
  };
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = "hyprctl dispatch dpms on";
          ignore_dbus_inhibit = false;
          lock_cmd = "hyprlock";
        };

        listener = [
          {
            timeout = 900;
            on-timeout = "hyprlock";
          }
          {
            timeout = 1200;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
    hyprpaper = {
      enable = true;
      settings = {
        ipc = "on";
        splash = false;
        splash_offset = 2.0;

        preload = ["/home/$USER/.config/hypr/wallpaper.png"];

        wallpaper = [
          ",/home/$USER/.config/hypr/wallpaper.png"
        ];
      };
    };
    hyprpolkitagent = {
      enable = true;
    };
    hyprsunset = {
      enable = true;
      transitions = {
        sunrise = {
          calendar = "*-*-* 06:00:00";
          requests = [
            ["temperature" "6500"]
            ["gamma 100"]
          ];
        };
        sunset = {
          calendar = "*-*-* 19:00:00";
          requests = [
            ["temperature" "3500"]
          ];
        };
      };
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = "";
    xwayland.enable = true;
    settings = {
      monitor = ",preferred,auto,1";

      "$terminal" = "footclient &";
      "$fileManager" = "nautilus &";
      "$menu" = "nice -n 15 fuzzel --show drun &";
      "$browser" = "nice -n 5 firefox &";
      "$vscode" = "nice -n 10 code &";

      exec-once = [
        "nice -n -5 foot --server & sleep 1"
        "mako &"
        "nice -n 15 hyprpapr & sleep 5"
        "nice -n 10 pidgin &"
      ];
      env = [
        "XCURSOR_SIZE,20"
        "HYPRCURSOR_SIZE,20"
      ];
      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        allow_tearing = false;
        "col.active_border" = "rgba(ff0000ee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };
      cursor.inactive_timeout = 5;

      decoration = {
        active_opacity = 0.98;
        inactive_opacity = 0.96;
        dim_special = 0.5;
        rounding_power = 2;
        rounding = 10;
        blur = {
          enabled = true;
          special = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;
          passes = 3;
          size = 10;
          # range = 4;
          # render_power = 3;
          # passes = 1;
          vibrancy = 0.1696;
        };

        shadow = {
          enabled = false;
          # offset = "2 2";
          # range = 4;
          # render_power = 3;
          # color = "rgba(1a1a1aaa)";
        };
      };

      animations = {
        bezier = [
          "almostLinear,0.5,0.5,0.75,1.0"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "easeOutQuint,0.23,1,0.32,1"
          "linear,0,0,1,1"
          "liner, 1, 1, 1, 1"
          "quick,0.15,0,0.1,1"
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "workIn, 0.72, -0.07, 0.41, 0.98"
        ];
        animation = [
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "global, 1, 10, default"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "workspaces, 1, 5, wind"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      debug = {
        disable_logs = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
        split_width_multiplier = 1.5;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      # Hyprland Keybindings

      "$mainMod" = "SUPER";

      bind =
        [
          "$mainMod, Q, exec, $terminal"
          "$mainMod, W, exec, $browser"
          "$mainMod, C, killactive,"
          "$mainMod, M, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, R, exec, $menu"
          "$mainMod, P, pseudo, # dwindle"
          "$mainMod, X, togglesplit, #dwindle"
          "$mainMod, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"

          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod, Return, exec, $vscode"
        ]
        ++ (
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mainMod, ${toString ws},workspace, ${toString ws}"
                "$mainMod SHIFT, ${toString ws}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        )
        ++ [
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 0, movetoworkspace, 10"
        ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        "$mainMod ALT, h, resizeactive, -10 0"
        "$mainMod ALT, j, resizeactive, 0 10"
        "$mainMod ALT, k, resizeactive, 0 -10"
        "$mainMod ALT, l, resizeactive, 10 0"
        "$mainMod SHIFT, h, swapwindow, l"
        "$mainMod SHIFT, j, swapwindow, d"
        "$mainMod SHIFT, k, swapwindow, u"
        "$mainMod SHIFT, l, swapwindow, r"
      ];

      misc.force_default_wallpaper = -1;
    };
  };
  home = {
    #.config/hypr/wallpaper.png
    file.wallpaper = {
      source = ./wallpaper.png;
      target = ".config/hypr/wallpaper.png";
    };

    pointerCursor = {
      hyprcursor = {
        enable = false;
        size = 32;
      };
    };
    preferXdgDirectories = true;
  };
}
