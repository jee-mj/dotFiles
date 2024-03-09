{ pkgs }:
with pkgs; [
  bat
  fd
  fzf
  nushell
  tldr

  ## Fish
  fish fishPlugins.z fishPlugins.autopair fishPlugins.forgit
  #fishPlugins.async-prompt
  fishPlugins.colored-man-pages 
  fishPlugins.fzf-fish # fishPlugins.github-copilot-cli-fish
  oh-my-fish
  
  ## Tmux
  tmux tmuxp tmuxifier tmux-cssh tmuxinator tmux-xpanes tmux-mem-cpu-load
  tmuxPlugins.yank tmuxPlugins.tmux-fzf tmuxPlugins.fuzzback tmuxPlugins.tmux-thumbs
  tmuxPlugins.dracula tmuxPlugins.tmux-colors-solarized
  tmuxPlugins.continuum
]
