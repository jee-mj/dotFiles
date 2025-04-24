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
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket = {
        enable = true;
      };
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };
}
