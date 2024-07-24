{
  config,
  pkgs,
  ...
}: {
  users = {
    users = {
      root = {
        isSystemUser = true;
        shell = pkgs.fish;
      };
      mj = {
        group = "users";
        isNormalUser = true;
        description = "vimv";
        extraGroups = ["networkmanager" "wheel" "podman" "audio" "jackaudio" "video" "disk" "sshd" "libvirtd" "docker"];
        home = "/home/mj";
        shell = pkgs.fish;
      };
      vim = {
        group = "users";
        isNormalUser = true;
        description = "vim";
        extraGroups = ["podman" "audio" "jackaudio" "video" "disk" "sshd"];
        home = "/home/vimv";
        shell = pkgs.bash;
      };
    };
  };
}
