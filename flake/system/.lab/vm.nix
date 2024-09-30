{
  inputs,
  config,
  lib,
  pkgs,
  user,
  hostnameroot,
  specialArgs, options, modulesPath
}: {
  imports = [
    ../../virtual/podman.nix
    ../../virtual/zerotier.nix
    ../../virtual/netdevs.nix
  ];
  virtualisation = {
    appvm = {
      enable = true;
      user = user;
    };
  };
}