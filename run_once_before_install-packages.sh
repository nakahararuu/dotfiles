#!/bin/bash

cat <<EOF > ~/Brewfile
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-versions"
tap "homebrew/core"
tap "homebrew/services"

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
cask "itsycal"
cask "karabiner-elements"
cask "stats"

# Window managment utils
brew "koekeishiya/formulae/yabai"
brew "koekeishiya/formulae/skhd"
# need Sonoma
# https://github.com/koekeishiya/yabai/issues/1889#issuecomment-1791066779
brew "felixkratz/formulae/borders"

# communication tools
cask "discord"
cask "skitch"
cask "slack"

# misc
brew "chezmoi"
cask "jdk-mission-control"
cask "google-chrome"
cask "onyx"
cask "kindle"
EOF

brew bundle --no-lock
brew bundle cleanup --force

yabai --restart-service
skhd --restart-service

exit 0
