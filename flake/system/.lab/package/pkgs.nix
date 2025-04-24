{
  inputs,
  config,
  pkgs,
  lib,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
  _class,
}: let
  baseApps = import ./base.nix {inherit pkgs;};
  shellApps = import ./shell.nix {inherit pkgs;};
  netApps = import ./net.nix {inherit pkgs;};

  cuda = import ./cuda.nix {inherit pkgs;};
  devApps = import ./dev.nix {inherit pkgs;};
  usrApps = import ./user.nix {inherit pkgs;};
  vmApps = import ./vm.nix {inherit pkgs;};
  dawApps = import ./daw.nix {inherit pkgs;};
  audioApps = import ./audio.nix {inherit pkgs;};
  audioPlugins = import ./plugins.nix {inherit pkgs;};
in {
  environment.systemPackages =
    shellApps
    ++ baseApps
    ++ netApps;

  users.users.kalki = {
    packages =
      devApps
      ++ dawApps
      ++ audioApps
      ++ audioPlugins
      ++ usrApps
      ++ vmApps;
  };

  users.users.mj = {
    packages =
      devApps
      ++ dawApps
      ++ audioApps
      ++ audioPlugins
      ++ usrApps
      ++ vmApps;
  };
  users.users.vim = {
    packages =
      devApps
      ++ usrApps;
  };
}
