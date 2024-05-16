{config, ...}: {
  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["mj"];
    };
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };

  services = {
    displayManager = {
      autoLogin = {
        enable = true;
        user = "vim";
      };
    };
  };
}
