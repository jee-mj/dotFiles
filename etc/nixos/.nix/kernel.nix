{ config, pkgs, ... }:
{
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
}