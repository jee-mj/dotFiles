{
  inputs, allUsers,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}: {
  imports = [
    # ../../virtual/podman.nix
    # ../../virtual/virt-manager.nix
    # ../../virtual/zerotier.nix
    ../../virtual/netdevs.nix
  ];
  virtualisation = {
    appvm = {
      enable = true;
      user = user;
    };
  };
}