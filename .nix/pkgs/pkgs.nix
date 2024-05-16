{
  config,
  pkgs,
  lib,
  ...
}: let
  aiApps = import ./ai.nix {inherit pkgs;};
  audioApps = import ./audio.nix {inherit pkgs;};
  baseApps = import ./base.nix {inherit pkgs;};
  cudaApps = import ./cuda.nix {inherit pkgs;};
  devApps = import ./dev.nix {inherit pkgs;};
  netApps = import ./net.nix {inherit pkgs;};
  pluginApps = import ./plugins.nix {inherit pkgs;};
  shellApps = import ./shell.nix {inherit pkgs;};
  usrApps = import ./user.nix {inherit pkgs;};
  vscodePlugins = import ./vscode.nix {inherit pkgs;};
in {
  environment.systemPackages = shellApps ++ baseApps ++ netApps;

  users.users.mj = {
    packages = devApps ++ usrApps ++ audioApps ++ pluginApps ++ aiApps ++ cudaApps;
  };
  users.users.vim = {
    packages = devApps ++ usrApps ++ audioApps ++ pluginApps;
  };
}
