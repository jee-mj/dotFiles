{ config, pkgs, ... }:
{
  boot = {
    initrd = {
      systemd = {
        dbus.enable = true;
        enable = true;
        enableTpm2 = true;
        network.enable = true;
      };
    };
    kernel.enable = true;
    kernel.sysctl = {
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "fq";
      "net.core.wmem_max" = 67108864;
      "net.core.rmem_max" = 67108864;
      "net.ipv4.tcp_rmem" = "1024 131072 67108864";
      "net.ipv4.tcp_wmem" = "1024 131072 67108864";
    };
    kernelModules = [ "ecryptfs" "tcp_bbr" ];
    kernelPackages = pkgs.linuxPackages_xen_dom0;
    kernelParams = [ "nohibernate" "dom0_mem=4096M" ];
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 300;
    };
    supportedFilesystems = [ "ntfs" ];
    tmp.cleanOnBoot = true;
  };
}
