#!/bin/bash

cat <<EOF > ~/Brewfile
tap "koekeishiya/formulae"
tap "felixkratz/formulae"

# aws
brew "awscli"
cask "aws-vault"

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
brew "gnupg"

# terminal, shell
cask "alacritty"
brew "fish"
brew "tmux"
brew "tmux-xpanes"
brew "terminal-notifier"
brew "howdoi"
brew "navi"

# editors
brew "neovim"
cask "intellij-idea"
cask "android-studio"
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
cask "google-japanese-ime"
cask "hiddenbar"
cask "karabiner-elements"
cask "stats"

# Window managment utils
brew "yabai"
brew "skhd"
brew "borders"
cask "homerow"

# communication tools
cask "discord"
cask "slack"

# misc
brew "chezmoi"
cask "jdk-mission-control"
cask "google-chrome"
EOF

brew bundle
brew bundle cleanup --force

exit 0
