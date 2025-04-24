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
}: {
  environment.systemPackages = with pkgs; [
    aha
    fwupd
    pciutils
    usbutils
    linuxquota

    kdePackages.alligator
    kdePackages.kleopatra
    kdePackages.kmail-account-wizard
    kdePackages.keditbookmarks
    kdePackages.kdenlive
    kdePackages.filelight
    kdePackages.sweeper
    kdePackages.kcachegrind
    kdePackages.zanshin
    kdePackages.calligra

    krusader
    skrooge

    cider
    thunderbird

    libreoffice-qt6-still
  ];
}
