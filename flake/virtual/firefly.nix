{
  lib,
  user,
  inputs,
  options,
  modulesPath,
  specialArgs,
  hostnameroot,
  config,
  pkgs,
}: {
  services = {
    firefly-iii = {
      enable = true;
      enableNginx = true;
      settings = {
        APP_ENV = "production";
        APP_KEY_FILE = ../../private/firefly-app-key.env;
      };
    };
  };
}
