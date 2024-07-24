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
      # luks.devices."luks-9ad68dae-35c9-47df-bc62-617ad8529087".device = "/dev/disk/by-uuid/9ad68dae-35c9-47df-bc62-617ad8529087";
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
    kernelModules = ["kvm-intel" "wl" "ecryptfs" "tcp_bbr"]; # REMOVED: "vfio-pci" "snd-seq" "snd-rawmidi"
    kernelParams = ["threadirq"]; # REMOVED:"kvm.ignore_msrs=1" "loglevel=7" "drm.debug=0x1e" "nohibernate"
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
