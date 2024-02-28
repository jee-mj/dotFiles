# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./zerotier.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "URIEL"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
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

  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    powerManagement.enable = false;
    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;
    
    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Enable CUPS to print documents.
  #  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable virtualisation support for docker
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Arion works with Docker, but for NixOS-based containers, Podman is required.
  virtualisation.docker.enable = false;
  virtualisation.podman.enable = true;
  virtualisation.podman.dockerSocket.enable = true;
  virtualisation.podman.defaultNetwork.settings = {
    dns_enabled = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mj = {
    isNormalUser = true;
    description = "vimv";
    extraGroups = [ "networkmanager" "wheel" "podman" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      _1password # Password Manager # Shell
      _1password-gui # Password Manager
      anki # Education
      audacity # Multimedia
      barrier # KVM
      bitwig-studio # Multimedia
      brave # Web
      cider # Multimedia
      # davinci-resolve # Multimedia
      discord # Chat
      element-desktop # Chat
      firefox # Web
      gimp # Multimedia
      hledger # Finance
      hledger-ui # Finance
      hledger-utils # Finance
      hledger-interest # Finance
      inkscape # Multimedia
      insomnia # Development
      kdenlive # Multimedia
      libreoffice-qt # Office
      lutris # Cross-Platform
      nmap # Network
      notable # Office
      qbittorrent-qt5 # Web
      steam # Cross-Platform
      tcpdump # Shell # Network
      virt-manager # Virtualisation
      vscode # Development
      wireshark # Network
      zeek # Network
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "mj";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    arion # Microservices
    autojump # Shell # QoL # TODO: LEARN
    bat # Shell # QoL
    docker # Microservices
    docker-client # Microservices
    docker-compose # Microservices
    dotnet-runtime_8 # Environment # .NET
    dotnet-sdk_8 # Language # .NET
    dotnet-aspnetcore_8 # Web # .NET
    dotnet-runtime_7 # Environment # .NET
    dotnet-sdk_7 # Language # .NET
    dotnet-aspnetcore_7 # Web # .NET
    dotnet-runtime # Environment  # .NET
    dotnet-sdk # Language # .NET
    dotnet-aspnetcore # Web # .NET
    dotnetPackages.Nuget # Package Manager
    filezilla # Utilities
    fish # Shell
    gdb # Shell # Development
    gh # Shell # Development
    git # Shell # Development
    go # Language # GO
    # htop # Shell # Utility
    htop-vim # Shell # Utility # Unstable
    libsForQt5.kate # Development # Office
    libsForQt5.konqueror # Web
    lsof # Shell # Administration
    oh-my-zsh # Shell # QoL
    mono # Language # .NET
    neovim # Shell # Development
    nerdfonts # QoL
    niv # Shell # Microservices
    nvidia-docker # Microservices
    obs-studio # Multimedia
    p7zip # Shell # Utility
    pciutils # Shell # Administration
    # powershell # Shell
    qemu # Virtualisation
    stow # QoL # dotfiles
    slack # Chat
    strace # Shell # Development # TODO: LEARN
    # terminus-nerdfont # QoL
    tldr # Shell # QoL
    tree # Shell # QoL
    vim # Shell # Development
    # vimPlugins.LazyVim # Shell # Development # QoL
    vlc # Video Player
    wineasio # Cross-Platform
    winetricks # Cross-Platform
    wineWowPackages.stable # Cross-Platform
    wget # Shell # Utility
    xsel # Shell # QoL
    zerotierone # QoL
    zsh # Shell
    zsh-powerlevel10k # Shell # QoL
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
 programs.mtr.enable = true;
 programs.gnupg.agent = {
   enable = true;
   enableSSHSupport = true;
 };
 programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  networking.firewall = {
    enable = true; # Ensure the firewall is enabled
    # allowedTCPPorts = [ 24800 ]; # Allow TCP on port 24800
    # allowedUDPPorts = [ 24800 ]; # Allow UDP on port 24800
    # currently borken
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
