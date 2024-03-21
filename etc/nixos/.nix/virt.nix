{config, pkgs, ...}: {
  programs.virt-manager.enable = true;
  virtualisation = {
    appvm = { enable = true; user = "mj"; };

    # bios = null;
    docker = {
      enable = false;
      enableNvidia = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd.enable = true;
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
    # xen = {
    #     enable = true;
    #     stored.enable = true;
    # };
  };
}