## vi mode
fish_vi_key_bindings

## XDG
set -gx XDG_CONFIG_HOME ~/.config

## default editor
set -gx EDITOR nvim

## aliases
alias g='git'                                             # git
alias rm='mise exec node@20.18.1 -- trash'              # trash-cli
alias cat='bat'                                         # bat
alias vi='nvim' && alias vim='nvim'                     # neovim
alias ivi='ideae' && alias ivim='ideae'                 # Intellij IDEA LiteEditMode
alias gemini='mise exec node@20.18.1 -- gemini'         # gemini-cli
alias claude='mise exec node@20.18.1 -- claude'         # claude

## ls colors
set -gx LSCOLORS gxfxcxdxbxegedabagacad

## man
set -gx MANPAGER "col -b -x|nvim -R -c 'set ft=man nolist nomod' -"

