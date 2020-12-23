#!/bin/bash

# homebrew-bundle
curl -o ~/Brewfile https://raw.githubusercontent.com/nakahararuu/dotfiles/master/Brewfile
brew bundle

# dotfiles
chezmoi init --apply --verbose https://nakahararuu@github.com/nakahararuu/dotfiles.git

# fzf
$(brew --prefix)/opt/fzf/install --all

# fisher plugins
fish -c "curl -sL git.io/fisher | source &&
         fisher install jorgebucaran/fisher &&
         chezmoi apply &&
         fisher update"

# trash-cli
npm install -g trash-cli

# cheat.sh
fish -c "complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'"

# tmux plugins
# see https://github.com/tmux-plugins/tpm/issues/6
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
tmux start-server && \
tmux new-session -d && \
sleep 1 && \
~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
tmux kill-server

