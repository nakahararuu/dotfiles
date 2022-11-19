#!/bin/bash

brew bundle --no-lock --file=/dev/stdin <<EOF
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "versent/taps"

# aws
brew "awscli"
brew "saml2aws"
cask "amazon-workspaces"
cask "aws-vault"
cask "session-manager-plugin"

# dev env
brew "asdf"
brew "direnv"
cask "docker"
brew "docker-compose"
brew "gcc"

# git
brew "diff-so-fancy"
brew "gh"
brew "ghq"
brew "git"
brew "git-secrets"
brew "tig"

# terminal, shell
cask "iterm2"
brew "fish"
brew "tmux"
brew "tmux-xpanes"
brew "terminal-notifier"
brew "howdoi"
brew "navi"

# editors
brew "neovim"
cask "intellij-idea"
cask "stoplight-studio"

# CLI utils
brew "bash"
brew "bat"
brew "coreutils"
brew "curl"
brew "fd"
brew "fzf"
brew "gawk"
brew "gron"
brew "hey"
brew "nkf"
brew "parallel"
brew "ripgrep"
brew "sd"
brew "telnet"
brew "up"
brew "wget"

# GUI Desktop utils
cask "alfred"
cask "alt-tab"
cask "google-japanese-ime"
cask "hiddenbar"
cask "itsycal"
cask "karabiner-elements"
cask "maccy"
cask "rectangle"
cask "stats"

# communication tools
cask "discord"
cask "skitch"
cask "slack"

# misc
brew "chezmoi"
cask "jdk-mission-control"
cask "microsoft-edge"
cask "onyx"

EOF

exit 0
