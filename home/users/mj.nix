# home.nix
{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../fish.nix
    ../themes/breeze-dark.nix
    ../vscode.nix
    # ./private/mj/ssh.nix
  ];

  options = {};
  config = {
    programs = {
      firefox = {
        enable = true;
      };
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
          gpg."ssh".program = "${pkgs._1password}/bin/op-ssh-sign";
          push.autoSetupRemote = true;
        };
        lfs.enable = true;
        package = pkgs.git;
        userName = "jee-mj";
        userEmail = "28581723+jee-mj@users.noreply.github.com";
      };
    };

    home = {
      username = user;
      homeDirectory = "/home/mj";
      packages = with pkgs; [
        gh
      ];
      pointerCursor = {
        name = "macOS-Monterey";
        package = pkgs.apple-cursor;
        size = 24;
      };
      stateVersion = "24.11";
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };
}
