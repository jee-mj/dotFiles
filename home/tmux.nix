{
  user,
  specialArgs, options, modulesPath,
  lib, pkgs, config, nixosConfig, osConfig
}: {
  programs = {
    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 0;
      clock24 = true;
      customPaneNavigationAndResize = true;
      disableConfirmationPrompt = false;
      escapeTime = 500;
      extraConfig = "";
      historyLimit = 9999;
      keyMode = "vi";
      mouse = false;
      newSession = true; # spawn a session if trying to attach and none are running
      prefix = "C-b";
      resizeAmount = 4;
      reverseSplit = false;
      secureSocket = true;
      sensibleOnTop = true;
      shell = "/etc/profiles/per-user/mj/bin/fish";
      terminal = "screen";
      tmuxp.enable = true;
      plugins = with pkgs.tmuxPlugins; [
        yank
        tmux-fzf
        fuzzback
        tmux-thumbs
        dracula
        tmux-colors-solarized
        gruvbox
        continuum
      ];
    };
  };
}
