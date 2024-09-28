{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "mj";
      };
    };
  };
}
