{
  inputs,
  config,
  pkgs,
  
  lib,
  user,
  hostnameroot,
  specialArgs, options, modulesPath
}: let
  baseApps = import ./base.nix {inherit pkgs;};
  shellApps = import ./shell.nix {inherit pkgs;};
  netApps = import ./net.nix {inherit pkgs;};
  
  devApps = import ./dev.nix {inherit pkgs;};
  usrApps = import ./user.nix {inherit pkgs;};
  vmApps = import ./vm.nix {inherit pkgs;};
in {
  environment.systemPackages =
    shellApps ++
    baseApps ++
    netApps;

  users.users.kalki = {
    packages = 
      devApps ++ 
      usrApps ++ 
      vmApps;
  };

  users.users.mj = {
    packages = 
      devApps ++ 
      usrApps ++ 
      vmApps;
  };
  users.users.vim = {
    packages = 
      devApps ++ 
      usrApps;
  };
}
