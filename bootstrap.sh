#!/bin/bash
set -euo pipefail

# dotfiles
if ! chezmoi -v COMMAND &> /dev/null; then
    brew install chezmoi
fi
chezmoi init --apply https://nakahararuu@github.com/nakahararuu/dotfiles.git

# homebrew-bundle
set +e
brew bundle
set -e

# fzf
$(brew --prefix)/opt/fzf/install --all

# fisher plugins
fish -c "curl -sL git.io/fisher | source && fisher update"

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

