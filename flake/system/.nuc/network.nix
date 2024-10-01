{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}: { # TODO: Review & Harden network
  # Define network interfaces
  networking.interfaces = {5
    "enp57s0u1u1" = {
      macAddress = "ff:ff:ff:ff:ff:ff";
      name = "enp57s0u1u1";
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "10.1.1.1";
          prefixLength = 19;
        }
      ];
      wakeOnLan = {
        enable = true;
        policy = ["broadcast" "arp" "phy"];
      };
    };
    "wlp58s0" = {
      macAddress = "ee:ee:ee:ee:ee:ee";
      name = "wlp58s0";
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "10.1.1.2";
          prefixLength = 19;
        }
      ];
      wakeOnLan = {
        enable = true;
        policy = ["broadcast" "arp" "phy"];
      };
    };
    "eno1" = {
      macAddress = "dd:dd:dd:dd:dd:dd";
      name = "eno1";
      useDHCP = true;
      wakeOnLan = {
        enable = true;
        policy = ["broadcast" "arp" "phy"];
      };
    };
  };

  # NAT and firewall using nftables
  networking.nftables = {
    enable = true;
  };
  networking.nat = {
    enable = true;
    externalInterface = "eno1";    # The WAN interface
    internalInterfaces = [ "enp57s0u1u1" "wlp58s0" ]; # The LAN interface
  };

  # Firewall rules (nftables)
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 8080 8081 8082 8083 8084 8085 8086 8087 ];  # Allow SSH, HTTP, HTTPS, 8x Development
    allowedUDPPorts = [ 53 67 68 ];   # Allow DNS, DHCP
  };

  # DHCP and DNS using dnsmasq
  services.dnsmasq = {
    alwaysKeepRunning = true;
    enable = true;
    settings = {
      interface = ["enp57s0u1u1" "wlp58s0"];  # Serve DHCP on LAN interface
      dhcp-range = [ "10.1.1.50,10.1.1.100" ];  # DHCP range on LAN
      domain-needed = true;  # Don't forward queries without a domain name
      bogus-priv = true;     # Block RFC1918 addresses from being forwarded
    };
  };

  # FRRouting for dynamic routing protocols (e.g., OSPF, BGP)
  services.frr = {
    # enable = true;
    zebra = {
      enable = true;
    };
    ospf = {
      enable = true;
    };
    bgp = {
      enable = true;
    };
    static = {
      enable = true;
    };
  };

  # Traffic monitoring with vnstat
  services.vnstat = {
    enable = true;
    # interfaces = [ "enp57s0u1u1" "eno1" ];  # Monitor both WAN and LAN interfaces
  };

  # System monitoring with Netdata
  services.netdata = {
    enable = true;
  };

  # UPnP and NAT-PMP service
  services.miniupnpd = {
    enable = true;
    externalInterface = "eno1";   # WAN interface
    internalIPs = [ "enp57s0u1u1" "wlp58s0" ];  # LAN interface
    natpmp = true;
  };

  # Fail2ban for protecting against brute-force attacks
  # services.fail2ban = {
  #   enable = true;
  #   jails.sshd = {
  #     enabled = true;
  #   };
  # };

  # AppArmor for security hardening
  security.apparmor.enable = true;
  # boot.kernelPackages = pkgs.linuxPackages;
  boot.kernelParams = [ "apparmor=1" "security=apparmor" ];

  hardware.wirelessRegulatoryDatabase = true;
    # Wireless Access Point using hostapd
    # services.hostapd = {
    #   enable = true;

    #   radios = {
    #     wlp58s0 = {  # Wireless interface
    #       band = "2g";
    #       countryCode = "AU";
    #       channel = 6;
    #       wifi4.capabilities = ["LDPC" "HT40+" "HT40-" "SHORT-GI-20" "SHORT-GI-40" "TX-STBC" "RX-STBC1"];
    #       networks = {
    #         wlp58s0 = {
    #           apIsolate = true;
    #           macAcl = "allow";
    #           ssid = "testing";  # Set SSID
    #           authentication = {
    #             mode = "wpa3-sae";
    #             saeAddToMacAllow = true;
    #             saePasswords = [
    #               {
    #                 password = "m0stsecurepassword";
    #               }
    #             ];
    #           };
    #         };
    #       };
    #     };
    #   };
    # }; # TODO: Low Priority, use onboard wifi chip to host separate network

  # iperf3 for network performance testing
  services.iperf3 = {
    enable = true;
    openFirewall = true;
  };
}
