{ config, pkgs, ... }:
{
    
  system.stateVersion = "23.11";
  
  time = {
    timeZone = "Australia/Sydney";
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes"];
      trusted-users = [ "nixos" ];
    };
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [];


  programs = {
    fish.enable = true;
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    ssh = {
    };
    tmux = {
      aggressiveResize = true;
      baseIndex = 1;
    	clock24 = true;
    	enable = true;
      terminal = "xterm-256color";
      keyMode = "vi";
    	plugins = with pkgs.tmuxPlugins; [
        yank
        tmux-fzf
        fuzzback
        tmux-thumbs
        dracula
        tmux-colors-solarized
        continuum
    	];
    };
    virt-manager.enable = true;
    wireshark.enable = true;
    zsh.enable = true;
  };

  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  networking = {
    enableIPv6 = true;
    firewall.enable = true;
    hostName = "URIEL-WSL";
    networkmanager.enable = true;
  };
}
