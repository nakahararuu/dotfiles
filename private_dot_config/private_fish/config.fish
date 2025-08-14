## vi mode
fish_vi_key_bindings

## default editor
set -gx EDITOR nvim

## aliases
alias g='git'                                             # git
alias rm='ASDF_NODEJS_VERSION=20.18.1 trash'              # trash-cli
alias cat='bat'                                           # bat
alias vi='nvim' && alias vim='nvim'                       # neovim
alias ivi='ideae' && alias ivim='ideae'                   # Intellij IDEA LiteEditMode
alias ghcs='gh copilot suggest'                           # suggest CLI command with github colipot
alias ghce='gh copilot explain'                           # explain CLI command with github colipot
alias gemini='ASDF_NODEJS_VERSION=20.18.1 command gemini' # gemini-cli
alias claude='ASDF_NODEJS_VERSION=18.17.0 command claude' # claude

## ls colors
set -gx LSCOLORS gxfxcxdxbxegedabagacad

## man
set -gx MANPAGER "col -b -x|nvim -R -c 'set ft=man nolist nomod' -"

