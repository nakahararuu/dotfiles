#!/bin/bash

# homebrew-bundle
curl -o ~/Brewfile https://raw.githubusercontent.com/nakahararuu/dotfiles/master/Brewfile
brew bundle

# dotfiles
chezmoi init --apply --verbose https://github.com/nakahararuu/dotfiles.git

# fzf
$(brew --prefix)/opt/fzf/install --all

# space vim
curl -sLf https://spacevim.org/install.sh | bash

# fisher plugins
fish -c "curl -sL git.io/fisher | source &&
         fisher install jorgebucaran/fisher &&
         chezmoi apply &&
         fisher update"

# trash-cli
npm install -g trash-cli

# tmux plugins
# see https://github.com/tmux-plugins/tpm/issues/6
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && \
tmux start-server && \
tmux new-session -d && \
sleep 1 && \
~/.tmux/plugins/tpm/scripts/install_plugins.sh && \
tmux kill-server

