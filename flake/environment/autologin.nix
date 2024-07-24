{
  config,
  pkgs,
  user,
  ...
}: {
  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = user;
      };
    };
  };
}
