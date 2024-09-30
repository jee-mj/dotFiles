{
  inputs,
  user, neve, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  users = {
    users = {
      root = {
        isSystemUser = true;
        shell = pkgs.fish;
      };
    };
  };
}
