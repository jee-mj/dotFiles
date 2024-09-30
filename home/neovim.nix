{
  user,
  specialArgs, options, modulesPath,
  lib, pkgs, config, nixosConfig, osConfig
}: {
  home.packages = with pkgs; [
    unzip
    luarocks
    python312Full
    pipenv
#    python312Packages.pip
    go
    julia
    jdk
    lua51Packages.lua
    php
    php82Packages.composer
    nodejs
    nodePackages.npm
    ruby
    rustup
    tree-sitter
  ];

  programs = {
    
    neovim = {
      package = pkgs.neovim-unwrapped;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
#      extraPackages = with pkgs; [
#        unzip
#        luarocks
#        python3
#        go
#        php
#        php82Packages.composer
#        nodejs
#        nodePackages.npm
#        rustup
#        tree-sitter
#      ];
    };
  };
}
