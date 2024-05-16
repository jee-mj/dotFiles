{
  config,
  pkgs,
  ...
}: {
  programs.virt-manager.enable = true;
  virtualisation = {
    appvm = {
      enable = true;
      user = "mj";
    };

    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
    podman = {
      enable = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };
}
