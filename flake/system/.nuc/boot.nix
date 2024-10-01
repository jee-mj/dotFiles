{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}: {
  boot = {
    # blacklistedKernelModules = [  ];
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
      "net.ipv4.tcp_congestion_control" = "bbr"; # Use BBR for better congestion control
      "net.core.default_qdisc" = "fq"; # Fair queueing
      "net.core.wmem_max" = 167772160; # Increased maximum send buffer size
      "net.core.rmem_max" = 167772160; # Increased maximum receive buffer size
      "net.ipv4.tcp_rmem" = "4096 87380 167772160"; # Increased TCP receive buffer
      "net.ipv4.tcp_wmem" = "4096 65536 167772160"; # Increased TCP send buffer
      "net.ipv4.tcp_no_metrics_save" = 1; # Disable TCP metrics saving
      "net.ipv4.tcp_sack" = 1; # Enable selective acknowledgment
      "net.ipv4.tcp_window_scaling" = 1; # Enable window scaling
    };
    kernelModules = ["kvm-intel" "iwlwifi" "ecryptfs" "tcp_bbr"];
    kernelParams = [
      "nohibernate"
      "usbcore.autosuspend=-1"
      ];
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
      timeout = 15;
    };
    # tmp.cleanOnBoot = true;
  };
}
