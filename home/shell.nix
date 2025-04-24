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
  fonts.fontconfig.enable = true;
  programs = {
    home-manager = {
      enable = true;
    };
    fzf = {
      enable = true;
      package = pkgs.fzf;
      tmux.enableShellIntegration = true;
    };
    htop = {
      enable = true;
      package = pkgs.htop-vim;
    };
    mise = {
      enable = true;
      package = pkgs.mise;
    };
    navi = {
      enable = true;
      package = pkgs.navi;
    };
    foot = {
      enable = true;
      server.enable = true;

      settings = {
        cursor = {
          # Tango
          color = "000000 babdb6";
        };
        colors = {
          # Tango
          foreground = "babdb6";
          background = "000000";
          regular0 = "2e3436";
          regular1 = "cc0000";
          regular2 = "4e9a06";
          regular3 = "c4a000";
          regular4 = "3465a4";
          regular5 = "75507b";
          regular6 = "06989a";
          regular7 = "d3d7cf";
          bright0 = "555753";
          bright1 = "ef2929";
          bright2 = "8ae234";
          bright3 = "fce94f";
          bright4 = "729fcf";
          bright5 = "ad7fa8";
          bright6 = "34e2e2";
          bright7 = "eeeeec";
        };
        main = {
          term = "xterm-256color";
          font = "0xProto Nerd Font Mono:size=16";
          dpi-aware = "yes";
        };
        mouse = {
          hide-when-typing = "yes";
        };
      };
    };
  };
}
