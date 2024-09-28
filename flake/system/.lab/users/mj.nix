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
        extraGroups = ["networkmanager" "wheel" "podman" "audio" "disk" "sshd"];
        home = "/home/mj";
        shell = pkgs.fish;
        openssh.authorizedKeys.keys = [ ];
      };
    };
  };
}
