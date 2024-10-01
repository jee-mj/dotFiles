{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}:
{
  #systemd.services."systemd-networkd".environment.SYSTEMD_LOG_LEVEL = "debug";
  networking.useNetworkd = true;
  networking.useDHCP = false;
  systemd.network = {
    enable = true;
    links = {
      # "10-pciEthernet" = {
      #   enable = true;
      #   matchConfig = { 
      #     MACAddress = "ff:ff:ff:ff:ff:ff";
      #   };
      #   linkConfig = {
      #     Name = "pciEth0";
      #   };
      # };
      "11-integratedEthernet" = {
        enable = true;
        matchConfig = { 
          MACAddress = "ff:ff:ff:ff:ff:ff";
        };
        linkConfig = {
          Name = "intEth0";
        };
      };
      # "20-integratedWireless" = {
      #   enable = true;
      #   matchConfig = { 
      #     MACAddress = "ff:ff:ff:ff:ff:ff";
      #   };
      #   linkConfig = {
      #     Name = "intWls0";
      #   };
      # };  
    };

    networks = {
      # "10-pciEthernet" = {
      #   enable = true;
      #   name = "pciEth0";
      #   networkConfig = {
      #     Address = ["10.1.1.1/24"];
      #     Gateway = "10.1.1.1";
      #     DNS = "10.1.1.1";
      #     DHCP = false;
      #   };
      # };
      "11-integratedEthernet" = {
        enable = true;
        name = "intEth0";
        # networkConfig = {
        #   DHCP = true;
        # };
        networkConfig = {
          Address = ["10.1.1.1/24"];
          Gateway = "10.1.1.1";
          DNS = "10.1.1.1";
          DHCP = false;
        };
      };
      # "20-integratedWireless" = {
      #   enable = true;
      #   name = "intWls0";
      #   networkConfig = {
      #     DHCP = true;
      #   };
      # };
    };
  };
}