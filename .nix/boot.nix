{
  config,
  pkgs,
  ...
}: {
  boot = {
    initrd = {
      luks.devices."luks-aa762d87-2eaa-4c4b-bd7f-e4461dfc066c".device = "/dev/disk/by-uuid/aa762d87-2eaa-4c4b-bd7f-e4461dfc066c";
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
    kernelModules = ["kvm-amd" "wl" "ecryptfs" "tcp_bbr" "snd-seq" "snd-rawmidi"];
    kernelParams = ["nohibernate" "threadirq"];
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
      timeout = 3;
    };
    supportedFilesystems = ["ntfs"];
    tmp.cleanOnBoot = true;
  };
}
