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
      kalki = {
        group = "users";
        isSystemUser = true;
        description = "kali";
        extraGroups = ["networkmanager" "wheel" "podman" "disk" "audio" "jackaudio" "video" "fuse"];
        home = "/home/kalki";
        shell = pkgs.fish;
        # uid = 1076;
      };
    };
  };
}
