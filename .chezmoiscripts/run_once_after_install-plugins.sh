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
set -e
asdf install

# GitHub CLI plugins
if gh auth status >/dev/null 2>&1; then
    gh extension install github/gh-copilot
else
    echo "Skipping GitHub CLI extensions: authentication required. Run 'gh auth login' first."
fi

# start background service
yabai --start-service
skhd --start-service

