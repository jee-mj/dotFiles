{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
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
