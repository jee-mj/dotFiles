{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}: {
  boot = {
    blacklistedKernelModules = [  ]; # "amdgpu"
    initrd = {
      systemd = {
        dbus.enable = true;
        enable = true;
        tpm2.enable = true;
        network.enable = true;
      };
    };
    kernel.enable = true;
    kernel.sysctl = {
      # Network Modifications
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.wmem_max" = 67108864;
      "net.core.rmem_max" = 67108864;
      "net.ipv4.tcp_rmem" = "1024 131072 67108864";
      "net.ipv4.tcp_wmem" = "1024 131072 67108864";
      "vm.swappiness" = 10;
    };
    ## The set of kernel modules to be loaded in the second stage of the boot process.
    kernelModules = ["kvm-amd" "wl" "ecryptfs" "tcp_bbr"];
    kernelParams = ["nohibernate"];
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 5;
    };
    supportedFilesystems = ["ntfs"];
  };
}
