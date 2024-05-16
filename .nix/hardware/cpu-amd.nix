{
  config,
  pkgs,
  ...
}: {
  hardware = {
    cpu = {
      amd = {
        sev.enable = true;
        sevGuest.enable = true;
      };
      x86.msr = {
        enable = true;
      };
    };
  };
}
