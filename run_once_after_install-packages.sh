#!/bin/bash
set -euo pipefail

set +e
brew bundle --no-lock --file=/dev/stdin <<EOF
tap "adoptopenjdk/openjdk"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"

brew "awscli"
brew "coreutils"
brew "asdf"
brew "bash"
brew "chezmoi"
brew "curl"
brew "python@3.9"
brew "direnv"
brew "docker"
brew "docker-compose"
brew "diff-so-fancy"
brew "fish"
brew "fzf"
brew "gawk"
brew "gcc"
brew "gh"
brew "ghq"
brew "git"
brew "git-secrets"
brew "gron"
brew "hey"
brew "howdoi"
brew "jq"
brew "navi"
brew "nkf"
brew "node"
brew "parallel"
brew "sd"
brew "telnet"
brew "terminal-notifier"
brew "tig"
brew "tmux"
brew "tmux-xpanes"
brew "up"
brew "vim"

cask "adoptopenjdk11"
brew "wget"
cask "alfred"
cask "alt-tab"
cask "google-japanese-ime"
cask "amazon-workspaces"
cask "aws-vault"
cask "docker"
cask "hiddenbar"
cask "intellij-idea"
cask "iterm2"
cask "itsycal"
cask "jdk-mission-control"
cask "karabiner-elements"
cask "maccy"
cask "microsoft-edge"
cask "onyx"
cask "rectangle"
cask "slack"
cask "stats"
cask "stoplight-studio"
EOF
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
