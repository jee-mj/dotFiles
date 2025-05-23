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
  virtualbox = {
    guest = {
      enable = true;
    };
    host = {
      addNetworkInterface = false;
      enable = true;
      enableExtensionPack = true;
      enableHardening = false;
      enableKvm = true;
    };
  };
}
