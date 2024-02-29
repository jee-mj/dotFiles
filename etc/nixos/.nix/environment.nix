{ config, pkgs, ... }:
let
  baseApps = import /etc/nixos/.nix/pkgs/appsSystem.nix { inherit pkgs; };
  devApps = import /etc/nixos/.nix/pkgs/appsDevelopment.nix { inherit pkgs; };
  devLibs = import /etc/nixos/.nix/pkgs/libsDevelopment.nix { inherit pkgs; };
  financeApps = import /etc/nixos/.nix/pkgs/appsFinance.nix { inherit pkgs; };
  kdeApps = import /etc/nixos/.nix/pkgs/appsSystemQt.nix { inherit pkgs; };
  mediaApps = import /etc/nixos/.nix/pkgs/appsMedia.nix { inherit pkgs; };
  networkApps = import /etc/nixos/.nix/pkgs/appsNetwork.nix { inherit pkgs; };
  officeApps = import /etc/nixos/.nix/pkgs/appsOffice.nix { inherit pkgs; };
  shellApps = import /etc/nixos/.nix/pkgs/appsSystemShell.nix { inherit pkgs; };
  socialApps = import /etc/nixos/.nix/pkgs/appsSocial.nix { inherit pkgs; };
  userApps = import /etc/nixos/.nix/pkgs/appsAuthorised.nix { inherit pkgs; };
  vmApps = import /etc/nixos/.nix/pkgs/appsVirtualisation.nix { inherit pkgs; };
in
{
  ## System Environment

  environment.systemPackages =
    shellApps   ++
    kdeApps     ++
    baseApps    ++
    officeApps  ++
    financeApps ++
    socialApps  ++
    networkApps;

  ## Users

  users = {

    users = {
      guest = {
        password = "guest";
        group = "guest";
        isNormalUser = true;
        description = "welcome";
        extraGroups = [ "networkmanager" ];
        shell = pkgs.fish;
        packages = mediaApps;
      };
      mj = {
        group = "users";
        isNormalUser = true;
        description = "vimv";
        extraGroups = [ "networkmanager" "wheel" "podman" ];
        shell = pkgs.fish;
        packages =
          userApps  ++
          devLibs   ++
          devApps   ++
          vmApps    ++  mediaApps;
      };
    };

    groups = {
      users = {
        gid = 100;
        members = [ "mj" ];
      };
      guest = {
        gid = 1000;
        members = [ "guest" ];
      };
    };

  };
}