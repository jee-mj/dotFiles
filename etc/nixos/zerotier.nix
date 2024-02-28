let
  privateZeroTierInterfaces = [ ""  ]; # ZT NET INTERFACE # Begins with `zk`
in {
  system.stateVersion = "23.11";

  services.openssh = {
    enable = true;
    openFirewall = false;
    settings = {
      PasswordAuthentication = true;
      X11Forwarding = true;
    };
    #ports = [ 22 ];



  };

#  services.openssh.enable = true;
#  services.openssh.openFirewall = false; # SSH ONLY ON VPN
#  services.openssh.passwordAuthentication = false;

  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = privateZeroTierInterfaces; # TRUST VPN ONLY
  
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

#  services.avahi.enable = true;
#  services.avahi.interfaces = privateZeroTierInterfaces; # ONLY BROADCAST ON VPN
#  services.avahi.ipv6 = true;
#  services.avahi.publish.enable = true;
#  services.avahi.publish.userServices = true;
#  services.avahi.publish.addresses = true;
#  services.avahi.publish.domain = true;
#  services.avahi.nssmdns = true;
#  services.avahi.publish.workstation = true; # ADDED TO DESKTOP MACHINES
  
  services.fail2ban = {
    enable = true;
    maxretry = 5;
    ignoreIP = [ "" ]; # Ignore one IP address
    bantime = "2160h";

    bantime-increment = {
      enable = true; # Enable increment of bantime after each violation
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "138240h"; # Do not ban for more than 1 week # this might be bad practice
      overalljails = true; # Calculate the bantime based on all the violations
    };
  };

  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [ "" ]; # ZT NETWORK ID # Should be 16 digits
}
