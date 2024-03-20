{ config, pkgs, ... }:
{
  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };
  services = {
    xserver = {
      videoDrivers = [ "amdgpu" "nvidia" ];
    };
  };
}