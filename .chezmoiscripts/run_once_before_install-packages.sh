#!/bin/bash

# Use Brewfile from chezmoi source directory directly
BREWFILE_PATH="$(chezmoi source-path)/Brewfile"

brew bundle --file="$BREWFILE_PATH"
brew bundle cleanup --file="$BREWFILE_PATH" --force

exit 0
