{ config, lib, pkgs, ... }:

{
  imports = [

    /etc/nixos/.nix/system.nix
    /etc/nixos/.nix/environment.nix
    /etc/nixos/.nix/patch/codeServer.nix
    <nixos-wsl/modules>
  ];

  wsl = {
    enable = true;
    #  extraBin = { # 240309
      # bin = {
      #   copy = false;
      #   name = "baseNameOf src";
      #   src = "/home/nixos/.wsl/apps/bin";
      # };
    # };
    defaultUser = "nixos";
    nativeSystemd = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;

    wslConf = {
      automount = {
        enabled = true;
        root = "/mnt";
      };
      interop = {
        appendWindowsPath = true;
        enabled = true;
        # includePath = true; # Fails to build 240309
        # register = false; # true sets explicit handling by binfmt_misc # 240309
      };
      network = {
        generateHosts = true;
        generateResolvConf = true;
        hostname = "URIEL-WSL";
      };
      user.default = "nixos";
    };

    # docker.enable = true;
  };

  system.stateVersion = "23.11";
}
