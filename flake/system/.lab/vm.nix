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
  imports = [
    ../../virtual/podman.nix
    ../../virtual/virt-manager.nix
    ../../virtual/zerotier.nix
    ../../virtual/netdevs.nix
  ];
  virtualisation = {
    appvm = {
      enable = true;
      inherit user;
    };
  };
}
