{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, 
}: {
  users = {
    users = {
      kalki = {
        group = "users";
        isNormalUser = true;
        description = "kali";
        extraGroups = [ "networkmanager" "wheel" "disk" "sshd" ];
        home = "/home/kalki";
        shell = pkgs.fish;
      };
    };
  };
}
