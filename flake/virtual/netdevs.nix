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
  _class, # musnix?
}: {
  # systemd.network = {
  #   netdevs = {
  #     "vm-root0" = {
  #       enable = true;
  #       netdevConfig = {
  #         Name = "vm-root0";
  #         Kind = "macvlan";
  #       };
  #       vlanConfig = {
  #         Id = 1;
  #         };
  #       macvlanConfig = {
  #         Mode = "bridge"; # bridge, private, vepa, passthru
  #       };
  #     };
  #     # "br0" = {
  #     #   enable = true;
  #     #   netdevConfig = {
  #     #     Name = "br0";
  #     #     Kind = "bridge";
  #     #   };
  #     # };
  #   };
  #
  #   networks = {
  #     "60-vm-root0" = {
  #       matchConfig = {
  #         Name = "vm-root0";
  #       };
  #       networkConfig = {
  #         Address = ["10.82.97.1/17"];
  #         # Gateway = "10.82.96.1";
  #         DNS = ["10.82.96.1"];
  #         # Bridge = "br0";
  #         # Routes = [ ];
  #       };
  #     };
  #     # "61-br0" = {
  #     #   matchConfig.Name = "br0";
  #     #   networkConfig = {
  #     #     DHCP = true;
  #     #   };
  #     # };
  #   };
  # };
}
