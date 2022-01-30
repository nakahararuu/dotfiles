## vi mode
fish_vi_key_bindings

## ls colors
set -gx LSCOLORS gxfxcxdxbxegedabagacad

## nciscolourenco/done (ring when a command is done)
set -U __done_notify_sound 1

## asdf (multiple runtime version manager)
source /usr/local/opt/asdf/asdf.fish
set -gx ASDF_CONFIG_FILE "$HOME/.config/asdf/asdfrc"

## trash-cli
alias rm='trash'

## direnv
direnv hook fish | source

## neovim
alias vi='nvim'
alias vim='nvim'
set -gx EDITOR nvim

## navi keybinding assign: ctrl+g(default) to ctrl+n
navi widget fish | sd '\\\cg' '\cn' | source
