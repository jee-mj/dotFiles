let
  privateZeroTierInterfaces = ["ztjlhs2qdk"]; # ZT NET INTERFACE # ztxxxxxxx
in {
  # networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = privateZeroTierInterfaces;

  services.avahi = {
    enable = true;
    allowInterfaces = privateZeroTierInterfaces;
    ipv6 = false;
    publish = {
      enable = true;
      userServices = true;
      addresses = true;
      domain = true;
      workstation = true;
    };
  };

  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [ "fada62b0154ff07f" ]; # ZT NETWORK ID - 16 digits
}
