{
  config,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../../environment/kde.nix
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

    spiceUSBRedirection.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [pkgs.OVMFFull.fd];
      };
    };
  };
  services.spice-vdagentd.enable = true;
}
