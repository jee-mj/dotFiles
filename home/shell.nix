{
  user,
  specialArgs, options, modulesPath,
  lib, pkgs, config, nixosConfig, osConfig
}: {
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
  };
  home = {
    file = {
      konsoleDefaultProfile = {
        target = ".local/share/konsole/default.profile";
        text = ''
          [Appearance]
          ColorScheme=Breeze
          TabColor=0,0,0

          [Cursor Options]
          CursorShape=1

          [General]
          Environment=TERM=xterm-256color,COLORTERM=truecolor
          LocalTabTitleFormat=%d : %n
          Name=Profile
          Parent=FALLBACK/

          [Interaction Options]
          UnderlineFilesEnabled=true

          [Keyboard]
          KeyBindings=default

          [Scrolling]
          HistoryMode=2

          [Terminal Features]
          BlinkingCursorEnabled=true
          UrlHintsModifiers=0
        '';
      };
    };
    packages = with pkgs; [
      # tmux
      ripgrep
      xclip
    ];
    shellAliases = {
      lsd = "lsd -la";
      lst = "lsd -la --tree --depth 2";
    };
  };
}
