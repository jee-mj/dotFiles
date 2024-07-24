{
  config,
  pkgs,
  ...
}: {
  musnix = {
    enable = true;
    # ffado.enable = true;
    # kernel = {
    #   realtime = true;
    #   packages = pkgs.linuxPackages_rt;
    # };
    # rtirq = {
    #   highList = "snd_hrtimer";
    #   resetAll = 1;
    #   prioLow = 0;
    #   enable = true;
    #   nameList = "rtc0 snd";
    # };
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
  services.ollama = {
    acceleration = "cuda";
    enable = true;
  };
}
