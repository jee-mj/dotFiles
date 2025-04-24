{
  inputs,
  user,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
  _class, # musnix?
}: let
  allUsers = ["mj" "vim" "kalki" "root"];
  userImports = builtins.map (username: ./users/${username}.nix) allUsers;
in {
  imports = userImports;
}
