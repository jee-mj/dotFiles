{
  inputs,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
  _class, # musnix?
}: {
  users = {
    users = {
      mj = {
        group = "users";
        isSystemUser = true;
        description = "vimv";
        extraGroups = ["networkmanager" "wheel" "podman" "disk" "jackaudio" "video" "fuse"];
        home = "/home/mj";
        shell = pkgs.fish;
      };
    };
  };
}
