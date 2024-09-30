{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}: {
  environment.systemPackages = with pkgs; [
    aha
    fwupd
    pciutils
    usbutils
    linuxquota

    kdePackages.alligator
    # kdePackages.neochat # depends libquotient 0.8.2 depends olm 3.2.16 (insecure)
    kdePackages.kleopatra
    # kdePackages.knotes
    kdePackages.kmail-account-wizard
    # kdePackages.korganizer
    kdePackages.keditbookmarks
    # kdePackages.kmail
    kdePackages.kdenlive
    kdePackages.filelight
    kdePackages.sweeper
    kdePackages.kcachegrind
    # kdePackages.kdevelop
    # kdePackages.kdev-php
    # kdePackages.kdev-python
    kdePackages.zanshin

    krusader
    skrooge
    kronometer
    # rsibreak

    cider
    thunderbird
    # [ktechlab marknote] currently not in repos

    ## Development Packages
    figma-linux
    insomnia
  firefox-devedition-bin
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
