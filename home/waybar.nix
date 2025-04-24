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
  #   imports = [
  #    ./tmux.nix
  #   ];
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 64;
          spacing = 16;
          output = [
            "DP-3"
          ];
          modules-left = ["clock" "tray"];
          modules-center = ["hyprland/window"];
          modules-right = ["hyprland/workspaces" "hyprland/mode" "custom/update_checker" "idle_inhibitor" "wireplumber"];

          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
            active-only = false;
          };
          # "cava" = {
          #   "cava_config" = "$XDG_CONFIG_HOME/cava/cava.conf";
          #   "framerate" = 30;
          #   "autosens" = 1;
          #   "sensitivity" = 100;
          #   "bars" = 14;
          #   "lower_cutoff_freq" = 50;
          #   "higher_cutoff_freq" = 10000;
          #   "method" = "pulse";
          #   "source" = "auto";
          #   "stereo" = true;
          #   "reverse" = false;
          #   "bar_delimiter" = 0;
          #   "monstercat" = false;
          #   "waves" = false;
          #   "noise_reduction" = 0.77;
          #   "input_delay" = 2;
          #   "format-icons" = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          #   "actions" = {
          #     "on-click-right" = "mode";
          #   };
          # };
          "clock" = {
            interval = 60;
            format = "{:%H %M}";
          };

          "tray" = {
            "icon-size" = 24;
            "spacing" = 16;
          };
          "wireplumber" = {
            "format" = "{icon} {volume}%";
            "format-muted" = "";
            "on-click" = "pavucontrol";
            "format-icons" = ["" "" ""];
          };
          "idle_inhibitor" = {
            "format" = "{icon}";
            "format-icons" = {
              "activated" = "";
              "deactivated" = "";
            };
          };
          "custom/update_checker" = {
            "exec" = "$HOME/.config/waybar/modules/updateChecker.fish";
            "on-click" = "$HOME/.config/waybar/modules/updateChecker.fish && notify-send 'The system has been updated'";
            "interval" = 3600;
            "tooltip" = true;
            "return-type" = "json";
            "format" = "{} {icon}";
            "format-icons" = {
              "has-updates" = "";
              "updated" = "";
            };
          };
        };
      };
      style = ''
        @import "theme.css";
        * {
          border: none;
          border-radius: 0;
          font-family: VictorMono Nerd Font Propo;
        }
        .modules-left {
          margin-left: 8px;
        }
        .modules-right {
          margin-right: 16px;
        }
        #window {
          font-family: 'Playwrite BR';
        }
        window#waybar {
          background: linear-gradient(180deg,rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, 0.96) 18%, rgba(0, 0, 0, 0.73) 78%, rgba(0, 0, 0, 0.64) 93.75%, rgba(0, 0, 0, 0) 94%);
          color: @highlight-white;
          font-size: 32px;
          font-weight: 300;
        }
        #workspaces button {
          padding: 0 5px;
        }

        #clock {
          font-family: Unsteady Oversteer;
          color: @highlight-yellow;
          font-size: 64px;
          margin-top: -16px;
        }

        #tray {
          background-color: rgba(34,51,51,0.73);
          border-radius: 12px;
          margin-left: 8px;
          margin-top: 12px;
          margin-bottom: 16px;
          padding: 8px;
        }

        #wireplumber {
          font-size: 24px;
          font-weight: 300;
        }

        #workspaces {
          font-size: 24px;
          font-weight: 800;
          margin-right: 16px;
          padding: 16px;
          border-radius: 12px;
        }

        #workspaces button:first-child {
          border-radius: 12px 0 0 12px;
          padding: 0 8px 0 12px;
        }

        #workspaces button:last-child {
          border-radius: 0 12px 12px 0;
          padding: 0 12px 0 8px;
        }

        #workspaces button:only-child {
          border-radius: 12px;
          padding: 0 12px 0 12px;
        }

        #workspaces button {
          color: @shadow-slate;
          background-color: @highlight-yellow;
          padding: 0 8px 0 8px;
        }

        #workspaces button.active {
          background-color: #0F0;
        }

        #workspaces button.visible {
          color: @standard-white;
          background-color: @shadow-blue;
        }

        #workspaces button.urgent {
          background-color: @highlight-green;
        }

        #workspaces button.empty {
          background-color: @shadow-orange;
        }

        #workspaces button.persistent {
          background-color: #00F;
        }

        #workspaces button.hidden {
          background-color: #F00;
        }

        #idle_inhibitor {
          font-size: 24px;
          font-weight: 300;
        }
      '';
    };
  };
  home = {
    file = {
      updateChecker = {
        executable = true;
        source = ./config/waybar/modules/updateChecker.fish;
        target = ".config/waybar/modules/updateChecker.fish";
      };
      theme = {
        target = ".config/waybar/theme.css";
        text = ''
          @define-color highlight-white #eee;
          @define-color standard-white #ddc;
          @define-color shadow-white #bbb;

          @define-color highlight-yellow #fe4;
          @define-color standard-yellow #ed0;
          @define-color shadow-yellow #ca0;

          @define-color highlight-green #8e3;
          @define-color standard-green #7d1;
          @define-color shadow-green #490;

          @define-color highlight-orange #fa3;
          @define-color standard-orange #f70;
          @define-color shadow-orange #c50;

          @define-color highlight-blue #79c;
          @define-color standard-blue #36a;
          @define-color shadow-blue #248;

          @define-color highlight-plum #a7a;
          @define-color standard-plum #757;
          @define-color shadow-plum #536;

          @define-color highlight-slate #888;
          @define-color standard-slate #555;
          @define-color shadow-slate #233;

          @define-color highlight-red #e22;
          @define-color standard-red #c00;
          @define-color shadow-red #a00;

        '';
      };
    };
    #   packages = with pkgs; [];
  };
}
