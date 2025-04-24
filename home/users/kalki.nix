# home.nix
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
  imports = [
    ../hyprland.nix
    ../waybar.nix
    ../fish.nix
    ../vscode.nix
    ./private/mj/tmux.nix
  ];

  options = {};
  config = {
    programs = {
      floorp.enable = true;
      gh = {
        enable = true;
        package = pkgs.gh;
        settings = {
          editor = "code";
          git_protocol = "ssh";
        };
      };
      gh-dash = {
        enable = true;
        package = pkgs.gh-dash;
        settings = {
          prSections = [
            {
              title = "My Pull Requests";
              filters = "is:open author:@me";
            }
          ];
        };
      };
      git = {
        enable = true;
        extraConfig = {
          gpg."ssh".program = "${pkgs._1password-cli}/bin/op-ssh-sign";
          push.autoSetupRemote = true;
          "http.https://*.mj/" = {
            sslVerify = false;
          };
        };
        lfs.enable = true;
        package = pkgs.git;
        userName = "jee-mj";
        userEmail = "28581723+jee-mj@users.noreply.github.com";
      };
      home-manager.enable = true;
    };

    home = {
      username = "kalki";
      homeDirectory = "/home/kalki";
      packages = with pkgs; [
        gh
      ];
      pointerCursor = {
        name = "macOS-Monterey";
        package = pkgs.apple-cursor;
        size = 32;
      };
      stateVersion = "24.11";
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };
}
