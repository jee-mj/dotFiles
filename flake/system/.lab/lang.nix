{
  inputs,
  user,
  neve,
  claude,
  hostnameroot,
  specialArgs,
  options,
  modulesPath,
  lib,
  pkgs,
  config,
  _class, # musnix?
}: {
  fonts.packages = with pkgs; [
    bakoma_ttf
    cantarell-fonts
    charis-sil
    corefonts
    dejavu_fonts
    eurofurence
    freefont_ttf
    google-fonts
    gyre-fonts
    helvetica-neue-lt-std
    # joypixels
    libertinus
    libre-bodoni
    nerd-fonts._0xproto
    nerd-fonts.roboto-mono
    nerd-fonts.victor-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-lgc-plus
    orbitron
    oxygenfonts
    poppins
    redhat-official-fonts
    roboto-flex
    stix-otf
    stix-two
    ttf-indic
    typodermic-public-domain
    ubuntu-sans
    ultimate-oldschool-pc-font-pack
    vistafonts
    xits-math
  ];
  time = {
    hardwareClockInLocalTime = true;
    timeZone = "Australia/Sydney";
  };
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };
}
