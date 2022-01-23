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

## vimrc location
set -gx VIMINIT ":source $HOME/.config/vim/vimrc"
