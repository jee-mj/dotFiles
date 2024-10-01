{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, 
}: {
  users = {
    users = {
      vim = {
        group = "users";
        isNormalUser = true;
        description = "vim";
        extraGroups = ["disk"];
        home = "/home/vimv";
        shell = pkgs.bash;
      };
    };
  };
}
