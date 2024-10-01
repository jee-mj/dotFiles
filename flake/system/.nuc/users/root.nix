{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, 
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
