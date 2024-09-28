{
  config,
  pkgs,
  user
}: {
  imports = [
    ../../virtual/zerotier.nix
    # ../../virtual/docker.nix
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
