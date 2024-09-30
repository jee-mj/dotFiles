{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
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
