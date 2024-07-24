{
  config,
  pkgs,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;
    };
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
  services = {xserver = {videoDrivers = ["nvidia"];};};
}
