{ config, pkgs, ... }: {
  imports = [
    ./shell.nix
  ];
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      historySize = 65536;
      historyFile = "";
      historyFileSize = 65536;
      historyIgnore = ["lsd" "cd" "ls" "exit" ":q"];
      shellAliases = {
        nixgc = "sudo ~/.config/jee-mj/nixgc.sh";
      };
    };
    mcfly = {
      enableBashIntegration = true;
    };
    mise = {
      enableBashIntegration = true;
    };
    navi = {
      enableBashIntegration = true;
    };
  };
  home.file = {
    gc = {
      executable = true;
      target = ".config/jee-mj/nixgc.sh";
      text = ''
        #!/bin/sh
        sudo nix-env --delete-generations old
        sudo nix-collect-garbage -d
      '';
    };
  };
}