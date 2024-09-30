{lib, config, inputs, user, hostnameroot, specialArgs, options, modulesPath}:
{
  systemd.network = {
    netdevs = {
      "vm-root0" = {
        enable = true;
        netdevConfig = {
          Name = "vm-root0";
          Kind = "macvlan";
        };
        vlanConfig = {
          Id = 1;
          };
        macvlanConfig = {
          Mode = "bridge";
        };
      };
    };

    networks = {
      "60-vm-root0" = {
        matchConfig = {
          Name = "vm-root0";
        };
        networkConfig = {
          Address = ["10.1.1.101/24"];
          # Gateway = "10.0.0.1";
          DNS = ["1.1.1.1"];
        };
      };
    };
  };
}