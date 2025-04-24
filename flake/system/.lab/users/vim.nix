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
      vim = {
        group = "users";
        isNormalUser = true;
        description = "vim";
        extraGroups = ["networkmanager" "podman" "disk" "jackaudio" "video" "fuse"];
        home = "/home/vimv";
        shell = pkgs.fish;
      };
    };
  };
}
