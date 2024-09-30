{
  inputs,
  user, neve, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  users = {
    users = {
      vim = {
        group = "users";
        isNormalUser = true;
        description = "vim";
        extraGroups = ["podman" "audio" "video" "disk"];
        home = "/home/vimv";
        shell = pkgs.bash;
      };
    };
  };
}
