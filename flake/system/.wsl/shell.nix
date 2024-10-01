{
  inputs,
  user, hostnameroot,
  specialArgs, options, modulesPath,
  lib, pkgs, config
}: {
  programs = {
    fish.enable = true;
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    mtr = {
      enable = true;
    };
    nano.enable = true;
#     neovim = {
#       enable = true;
#       defaultEditor = true;
#       viAlias = true;
#       vimAlias = true;
#     };
#     tmux = {
#       aggressiveResize = true;
#       baseIndex = 1;
#       clock24 = true;
#       enable = true;
#       terminal = "xterm-256color";
#       keyMode = "vi";
#       plugins = with pkgs.tmuxPlugins; [
#         yank
#         tmux-fzf
#         fuzzback
#         tmux-thumbs
#         dracula
#         tmux-colors-solarized
#         gruvbox
#         continuum
#       ];
#     };
  };
}
