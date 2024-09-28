{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  users = {
    users = {
      kalki = {
        group = "users";
        isNormalUser = true;
        description = "kali";
        extraGroups = [ "networkmanager" "wheel" "podman" "audio" "disk" "sshd" ];
        home = "/home/kalki";
        shell = pkgs.fish;
      };
    };
  };
}
