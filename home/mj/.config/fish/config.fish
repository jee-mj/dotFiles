set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias nvim-use-node "nix-shell ~/.config/nvim/shell.nix --run nvim"
alias nixgc "sudo ~/.config/jee-mj/nixgc.sh"
alias lt "ll --tree --level=2 -ah"
alias ll "eza -l -g --icons"
alias g git

# set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
    source (dirname (status --current-filename))/config-linux.fish
        # case '*'
        # source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
