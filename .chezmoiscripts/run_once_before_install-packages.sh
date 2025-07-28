#!/bin/bash

# Copy Brewfile from chezmoi source to home directory for brew bundle
cp "$(chezmoi source-path)/Brewfile" ~/Brewfile

brew bundle
brew bundle cleanup --force

exit 0
