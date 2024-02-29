{ config, pkgs, ... }:

{
  system.stateVersion = "unstable";

  imports =
    [
      /etc/nixos/.nix/system.nix
      /etc/nixos/.nix/environment.nix
    ];


  # The configuration has been modularized into separate files for clarity and ease of management.

  # environment.nix provisions the system environment and user accounts.
  # system.nix includes time, nix, sound, hardware, virtualisation & networking packages.
  # boot.nix contains boot & kernel packages, referenced within system.nix.
  # kde.nix encompasses services, programs, kde, qt, xdg settings, also referenced within system.nix.

}
