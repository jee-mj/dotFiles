{
  config,
  pkgs
}: {
  users = {
    users = {
      root = {
        isSystemUser = true;
        shell = pkgs.fish;
      };
      kalki = {
        group = "users";
        isNormalUser = true;
        description = "kali";
        extraGroups = ["networkmanager" "wheel" "podman" "audio" "jackaudio" "video" "disk" "sshd" "libvirtd" "docker"];
        home = "/home/kalki";
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
        description = "vimv";
        extraGroups = ["podman" "audio" "jackaudio" "video" "disk" "sshd"];
        home = "/home/vimv";
        shell = pkgs.bash;
      };
    };
  };
}
