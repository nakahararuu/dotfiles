## vi mode
fish_vi_key_bindings

## ls colors
set -gx LSCOLORS gxfxcxdxbxegedabagacad

## nciscolourenco/done (ring when a command is done)
set -U __done_notify_sound 1

## asdf (multiple runtime version manager)
source /usr/local/opt/asdf/asdf.fish

# trash-cli
alias rm='trash'
