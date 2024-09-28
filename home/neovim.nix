{
  user,
  specialArgs, options, modulesPath,
  lib, pkgs, config, nixosConfig, osConfig
}: {
  programs = {
    neovim = {
      package = pkgs.neovim;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
  };
}