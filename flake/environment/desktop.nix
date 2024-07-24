{
  config,
  pkgs,
  user,
  ...
}: {
  environment.systemPackages = with pkgs; [
    aha
    fwupd
    pciutils
    usbutils
  ];
  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [user];
    };
    # firefox = {
    # enable = true;
    # preferences = {
    #   "widget.use-xdg-desktop-portal.file-picker" = 1;
    # };
    # };
  };
}
