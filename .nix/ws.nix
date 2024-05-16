{
  config,
  pkgs,
  ...
}: {
  musnix = {
    enable = true;
    ffado.enable = true;
    kernel = {
      realtime = true;
      packages = pkgs.linuxPackages_latest_rt;
    };
    rtirq = {
      highList = "snd_hrtimer";
      resetAll = 1;
      prioLow = 0;
      enable = true;
      nameList = "rtc0 snd";
    };
  };

  services.ollama = {
    acceleration = "cuda";
    enable = true;
  };
}
