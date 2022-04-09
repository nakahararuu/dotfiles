## vi mode
fish_vi_key_bindings

## ls colors
set -gx LSCOLORS gxfxcxdxbxegedabagacad

## nciscolourenco/done (ring when a command is done)
set -U __done_notify_sound 1

## asdf (multiple runtime version manager)
source /usr/local/opt/asdf/asdf.fish
set -gx ASDF_CONFIG_FILE "$HOME/.config/asdf/asdfrc"
set -gx ASDF_NPM_DEFAULT_PACKAGES_FILE "$HOME/.config/asdf/default-npm-packages"

## aliases
alias g ='git'                          # git
alias rm='trash'                        # trash-cli
alias cat='bat'                         # bat
alias vi='nvim' && alias vim='nvim'     # neovim
alias ivi='ideae' && alias ivim='ideae' # Intellij IDEA LiteEditMode

## direnv
direnv hook fish | source

## default editor
set -gx EDITOR nvim

## navi keybinding assign: ctrl+g(default) to ctrl+n
navi widget fish | sd '\\\cg' '\cn' | source

