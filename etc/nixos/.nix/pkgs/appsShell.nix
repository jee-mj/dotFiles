{ pkgs }:

let
  # Override the kord package
  kordCustom = pkgs.kord.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner =  "twitchax";
      repo = "kord";
      rev = "1e7e08773b9c4b34227f9658aecdfe444d065342";
      hash = "sha256-XerR6KiXvrXF/jNGNSuCQQXzJDgdojuzZ4TsDQExpb4=";
    };
  });
in
with pkgs; [
  bat
  # kordCustom
  lm_sensors
  mosh
  nano
  nerdfonts
  openssl
  tldr
  xsel

  ## Fish
  fish # fishPlugins.z fishPlugins.autopair fishPlugins.forgit
  # fishPlugins.async-prompt fishPlugins.colored-man-pages 
  # fishPlugins.fzf-fish # fishPlugins.github-copilot-cli-fish
  # oh-my-fish
   
  ## Tmux
  tmux tmuxp tmuxifier tmux-cssh tmuxinator tmux-xpanes tmux-mem-cpu-load
  tmuxPlugins.yank tmuxPlugins.tmux-fzf tmuxPlugins.fuzzback tmuxPlugins.tmux-thumbs
  tmuxPlugins.dracula tmuxPlugins.tmux-colors-solarized
  tmuxPlugins.continuum
]
