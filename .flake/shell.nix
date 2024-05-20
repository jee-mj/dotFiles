{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./neovim.nix
  ];
  programs = {
    home-manager = {
      enable = true;
    };
    fzf = {
      enable = true;
      package = pkgs.fzf;
      tmux.enableShellIntegration = true;
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
      fuzzySearchFactor = 3;
      fzf.enable = true;
      keyScheme = "vim";
    };
    mise = {
      enable = true;
      package = pkgs.mise;
    };
    navi = {
      enable = true;
      package = pkgs.navi;
    };
  };
  home = {
    shellAliases = {
      lsd = "lsd -la";
      lst = "lsd -la --tree --depth 2";
      nvim-use-node = "nix-shell ~/.config/nvim/shell.nix --run nvim";
    };
  };
}
