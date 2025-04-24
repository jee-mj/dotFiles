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
  environment.systemPackages = with pkgs; [
    brave
    cider
    thunderbird
    figma-linux
    insomnia
    wavebox
    code-cursor

    ### JACK
    # libjack2
    # jack2
    # qjackctl
    pipewire
    patchage
  ];
  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["mj" "kalki"];
    };
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
      };
    };
  };

  services = {
    colord.enable = true;
    # jack = {
    #   jackd.enable = true;
    #   # support ALSA only programs via ALSA JACK PCM plugin
    #   alsa.enable = false;
    #   # support ALSA only programs via loopback device (supports programs like Steam)
    #   loopback = {
    #     enable = true;
    #     # buffering parameters for dmix device to work with ALSA only semi-professional sound programs
    #     dmixConfig = ''
    #       period_size 2048
    #     '';
    #   };
    # };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
      extraConfig = {
        # The default JACK latency is 1024/48000.
        # This entire `extraConfig` was just to change that.
        # Maybe I could get rid of the rest of it.
        jack = {
          "10-clock-rate" = {
            "jack.properties" = {
              "node.latency" = "128/48000";
              "node.rate" = "1/48000";
            };
          };
        };
        pipewire = {
          "10-clock-rate" = {
            "context.properties" = {
              "default.clock.rate" = 48000;
              "default.clock.allowed-rates" = [
                44100
                48000
                88200
                96000
              ];
              "default.clock.quantum" = 32;
              "default.clock.min-quantum" = 16;
              "default.clock.max-quantum" = 8192;
            };
          };
        };
      };
    };
    ntp.enable = true;
  };
}
