{
  inputs,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
}: {
  programs = {
    _1password.enable = true;
    fish.enable = true;
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    mtr = {
      enable = true;
    };
    nano.enable = false;
  };
}
