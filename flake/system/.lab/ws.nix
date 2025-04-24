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
}: {
  imports = [
    ../../environment/autologin.nix
    ../../environment/gnome-hyprland.nix
  ];
  musnix = {
    enable = true;
    alsaSeq.enable = false;
    ffado.enable = true;
    kernel = {
      realtime = true;
    };
    rtcqs.enable = true;
    rtirq = {
      highList = "snd_hrtimer";
      resetAll = 1;
      prioLow = 0;
      enable = true;
      nameList = "rtc0 snd";
    };
  };
  # nix.settings = {
  #   # Binary Caching
  #   trusted-substituters = [
  #     "https://ai.cachix.org"
  #   ];
  #   trusted-public-keys = [
  #     "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
  #   ];
  # };
  # services.ollama = {
  #   acceleration = "cuda";
  #   enable = true;
  # };
  # services.open-webui = {
  #   enable = true;
  #   host = "10.82.96.52";
  #   port = 11111;
  #   openFirewall = true;
  # };
}
