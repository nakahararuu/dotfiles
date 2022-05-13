#!/bin/bash
set -euo pipefail

set +e
brew bundle --no-lock --file=/dev/stdin <<EOF
tap "adoptopenjdk/openjdk"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "versent/taps"

brew "awscli"
brew "coreutils"
brew "asdf"
brew "bash"
brew "bat"
brew "chezmoi"
brew "curl"
brew "fd"
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
brew "parallel"
brew "ripgrep"
brew "saml2aws"
brew "sd"
brew "telnet"
brew "terminal-notifier"
brew "tig"
brew "tmux"
brew "tmux-xpanes"
brew "up"
brew "wget"
brew "neovim"

cask "adoptopenjdk11"
cask "alfred"
cask "alt-tab"
cask "discord"
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
cask "session-manager-plugin"
cask "skitch"
cask "slack"
cask "stats"
cask "stoplight-studio"
EOF
set -e

# fisher plugins
fish -c "curl -sL git.io/fisher | source && fisher update"

# asdf plugin & global npm packages
set +e && asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git && set -e
asdf install

# cheat.sh
fish -c "complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'"

# tmux plugins
# see https://github.com/tmux-plugins/tpm/issues/6
if [ -e ~/.config/tmux/plugins/tpm ]; then
    cd ~/.config/tmux/plugins/tpm && git pull && cd - && \
    tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    ~/.config/tmux/plugins/tpm/scripts/update_plugin.sh
else
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && \
    tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    ~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
fi
tmux kill-server

