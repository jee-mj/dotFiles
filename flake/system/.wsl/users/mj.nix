{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  users = {
    users = {
      mj = {
        group = "users";
        isNormalUser = true;
        description = "vimv";
        extraGroups = ["wheel" "audio" "disk"];
        home = "/home/mj";
        shell = pkgs.fish;
      };
    };
  };
}
