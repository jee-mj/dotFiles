{
  config,
  pkgs
}: {
  imports = [
    ../../environment/autologin.nix
    ../../environment/kde5.nix
  ];
  services.ollama = {
    acceleration = "cuda";
    enable = true;
  };
}
