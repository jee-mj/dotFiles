{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./shell.nix
  ];
  programs = {
    mcfly = {
      enableFishIntegration = true;
    };
    mise = {
      enableFishIntegration = true;
    };
    navi = {
      enableFishIntegration = true;
    };
    fish = {
      enable = true;
      package = pkgs.fish;
      shellAbbrs = {
        nixgc = "sudo ~/.config/jee-mj/nixgc.fish";
      };
      shellInit = ''
        set fish_greeting ""
        set -g theme_color_scheme terminal-dark
        set -g fish_prompt_pwd_dir_length 1
        set -g theme_display_user yes
        set -g theme_hide_hostname no
        set -g theme_hostname always
      '';
    };
  };
  home.file = {
    fishPrompt = {
      source = ./config/fish/functions/fish_prompt.fish;
      target = ".config/fish/functions/fish_prompt.fish";
    };
    gc = {
      executable = true;
      target = ".config/jee-mj/nixgc.fish";
      text = ''
        #!/bin/sh
        sudo nix-env --delete-generations old
        sudo nix-collect-garbage -d
      '';
    };
  };
}