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
  services = {
    displayManager = {
      autoLogin = {
        enable = false;
        user = "kalki";
      };
    };
  };
}
