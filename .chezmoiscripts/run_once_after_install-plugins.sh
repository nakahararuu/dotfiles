#!/bin/bash
set -euo pipefail

# fisher plugins
fish -c "curl -sL git.io/fisher | source && fisher update"

# asdf plugin & global npm packages
set +e
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add java https://github.com/halcyon/asdf-java.git
asdf plugin add python
asdf plugin add golang
asdf install nodejs 18.17.0
asdf install nodejs 20.18.1
set -e
asdf install

# GitHub CLI plugins
gh extension install github/gh-copilot

# start background service
yabai --start-service
skhd --start-service

