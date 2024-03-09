{ config, pkgs, ... }:
let
  baseApps = import /etc/nixos/.nix/pkgs/appsBase.nix { inherit pkgs; };
  networkApps = import /etc/nixos/.nix/pkgs/appsNetwork.nix { inherit pkgs; };
  shellApps = import /etc/nixos/.nix/pkgs/appsShell.nix { inherit pkgs; };
  clang = import /etc/nixos/.nix/pkgs/libC.nix {inherit pkgs;};
in
{
  ## System Environment

  environment = {
    systemPackages =
      shellApps   ++
      baseApps    ++
      networkApps ++ clang;
  };

  ## Users

  users = {
    users = {
      root = {
        shell = pkgs.fish;
        };
      nixos = {
        shell = pkgs.fish;
        };
    };
  };
}
