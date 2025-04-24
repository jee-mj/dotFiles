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
  imports = [
    ../../../hardware-configuration.nix
    ./package/pkgs.nix
    ./boot.nix
    ./lang.nix
    ./shell.nix
    ./vm.nix
    ./ws.nix
    ./user.nix
  ];

  system.stateVersion = "24.11";
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
      sandbox = false;
      substituters = [];
      trusted-users = ["mj" "vim"];
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
      # Allow Binary Caches
      allowBootstrapBinaryCaches = true;
      # Use specific configurations that rebuild the bootstrap binaries
      bootstrapPackages = pkgs.rebuild-bootstrap;
    };
  };

  security = {
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraConfig = ''
        %wheel ALL=(ALL) NOPASSWD: ALL
      '';
    };
  };

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    usb-modeswitch.enable = false;
    usbStorage.manageShutdown = true;
  };

  networking = {
    # enableIPv6 = true;
    firewall.enable = false;
    networkmanager = {
      enable = false;
      wifi.powersave = false;
    };
  };

  services = {
    xserver.videoDrivers = ["nvidia"];
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no"; # Disable root login over SSH
        PasswordAuthentication = false; # Enforce key-based authentication
      };
    };
    postgresql = {
      enable = true;
      enableTCPIP = true;
      ensureDatabases = ["mydatabase" "solana_token_historical"];
      authentication = pkgs.lib.mkOverride 10 ''
        local all all trust
        host solana_token_historical trader 127.0.0.1/32 trust
        host all admin all password
      '';
      initialScript = pkgs.writeText "init-sql-script" ''
        CREATE USER mj;
        CREATE DATABASE mj OWNER mj;
        GRANT ALL PRIVILEGES ON DATABASE mj TO mj;
        ALTER USER mj WITH SUPERUSER;
        CREATE USER trader;
        CREATE DATABASE solana_token_historical OWNER trader;
        GRANT ALL PRIVILEGES ON DATABASE solana_token_historical TO trader;
      '';
    };

    vscode-server.enable = true;
    usbmuxd.enable = true;
  };
}
