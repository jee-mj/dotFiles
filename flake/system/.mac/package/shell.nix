{pkgs}:
with pkgs; [
  bat
  hyfetch
  htop-vim
  rsync
  tldr
  tree
  xsel

  vimPlugins.barbecue-nvim
  vimPlugins.coc-rust-analyzer
  vimPlugins.neovim-sensible
  vimPlugins.telescope-fzf-native-nvim
  vimPlugins.telescope-nvim
  vimPlugins.telescope-z-nvim
  vimPlugins.telescope-undo-nvim
  vimPlugins.gruvbox
]
