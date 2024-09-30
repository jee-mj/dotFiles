{
  inputs,
  user, neve, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  users = {
    users = {
      kalki = {
        group = "users";
        isNormalUser = true;
        description = "kali";
        extraGroups = ["networkmanager" "wheel" "podman" "audio" "disk" "sshd" "libvirtd" ];
        home = "/home/kalki";
        shell = pkgs.fish;
      };
    };
  };
}
