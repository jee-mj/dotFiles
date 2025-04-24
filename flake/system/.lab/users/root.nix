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
  _class, # musnix?
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
