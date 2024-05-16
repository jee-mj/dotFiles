{pkgs}:
with pkgs; [
  bat
  direnv
  gdb
  htop-vim
  rsync
  tldr
  tree
  xsel

  # fishPlugins.z fishPlugins.autopair fishPlugins.forgit
  # fishPlugins.async-prompt fishPlugins.colored-man-pages
  # fishPlugins.fzf-fish fishPlugins.puffer fishPlugins.plugin-git

  vimPlugins.barbecue-nvim
  vimPlugins.coc-rust-analyzer
  vimPlugins.neovim-sensible
  vimPlugins.telescope-fzf-native-nvim
  vimPlugins.telescope-nvim
  vimPlugins.telescope-z-nvim
  vimPlugins.telescope-undo-nvim
  vimPlugins.gruvbox
]
