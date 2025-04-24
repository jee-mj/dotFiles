{
  lib,
  config,
  specialArgs,
  modulesPath,
  inputs,
  options,
  system,
  user,
  neve,
  claude,
  pkgs,
  hostnameroot,
  _class, # musnix?
}: {
  nix.gc = {
    automatic = true;
    dates = "01:00";
    options = "--delete-older-than 7d";
    persistent = true;
    randomizedDelaySec = "60min";
  };
  system.autoUpgrade = {
    allowReboot = false;
    dates = "00:00";
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--no-write-lock-file"
      "-L" # print build logs
    ];
    operation = "switch";
    randomizedDelaySec = "60min";
    rebootWindow = {
      lower = "06:00";
      upper = "07:00";
    };
  };
}
