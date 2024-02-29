{ config, pkgs, ... }:
{
  boot = {
    initrd = {
      systemd = {
        dbus.enable = true;
        enable = true;
        enableTpm2 = true;
        groups.guest.gid = 1000;
        groups.users.gid = 100;
        network.enable = true;
        users.guest.uid = 100;
        users.guest.shell = "/run/current-system/sw/bin/fish";
        users.mj.uid = 1000;
        users.mj.shell = "/run/current-system/sw/bin/fish";
      };
    };
    kernel.enable = true;
    kernelModules = ["ecryptfs"];
    loader = {
      systemd-boot = {
        enable = true;
        memtest86.enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
  };
}
