{
  config,
  pkgs,
  ...
}: {
  boot = {
    extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';
    # blacklistedKernelModules = [ "rtl8821ce" "r8169" ];
    initrd = {
      # luks.devices."luks-<UUID>".device = "/dev/disk/by-uuid/<UUID>";
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
    kernelModules = ["kvm-amd" "wl" "ecryptfs" "tcp_bbr" "vfio-pci" "snd-seq" "snd-rawmidi"]; # REMOVED:
    kernelParams = ["nohibernate" "threadirq"]; # REMOVED:"kvm.ignore_msrs=1" "loglevel=7" "drm.debug=0x1e"
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        device = "nodev";
        efiSupport = true;
        enable = true;
        useOSProber = true;
        timeoutStyle = "menu";
      };
      timeout = 15;
    };
    supportedFilesystems = ["ntfs"];
    tmp.cleanOnBoot = true;
  };
}
