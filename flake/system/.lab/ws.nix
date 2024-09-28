{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config, pkgs-unstable
}: {
  services.ollama = {
    acceleration = "cuda";
    enable = true;
  };
  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    port = 8080;
    openFirewall = true;
  };
}
