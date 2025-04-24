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
}: {
  imports = [
    ../../virtual/zerotier.nix
    ../../virtual/docker.nix
    ../../virtual/podman.nix
    ../../virtual/virt-manager.nix
  ];
  virtualisation = {
    appvm = {
      enable = true;
      user = user;
    };
  };
}
