{
  config,
  pkgs,
  ...
}: {
  programs = {
    home-manager = {
      enable = true;
    };
    htop = {
      enable = true;
      package = pkgs.htop-vim;
    };
    librewolf = {
      enable = true;
      package = pkgs.librewolf;
    };
    mcfly = {
      enable = true;
      fzf.enable = true;
    };
    mise = {
      enable = true;
      package = pkgs.mise;
    };
    navi = {
      enable = true;
      package = pkgs.navi;
    };

    neovim = {
      package = pkgs.neovim-unwrapped;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
  };
  home = {
    file = {
      nvim = {
        source = ./config/nvim;
        target = ".config/nvim";
        recursive = true;
      };
      sshAgentOnePassword = {
        target = ".ssh/config";
        text = ''
          Host *
            IdentityAgent ~/.1password/agent.sock
        '';
      };
    };
    shellAliases = {
      lsd = "lsd -la";
      lst = "lsd -la --tree --depth 2";
      nvim-use-node = "nix-shell ~/.config/nvim/shell.nix --run nvim";
    };
  };
}
