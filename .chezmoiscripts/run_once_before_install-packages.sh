#!/bin/bash

# Copy Brewfile from chezmoi source to home directory for brew bundle
# Try chezmoi source-path first, fallback to relative path
if command -v chezmoi >/dev/null 2>&1; then
    BREWFILE_SOURCE="$(chezmoi source-path)/Brewfile"
else
    # Fallback: use relative path from script location
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    BREWFILE_SOURCE="$(dirname "$SCRIPT_DIR")/Brewfile"
fi

if [[ -f "$BREWFILE_SOURCE" ]]; then
    cp "$BREWFILE_SOURCE" ~/Brewfile
else
    echo "Error: Could not find Brewfile at $BREWFILE_SOURCE"
    exit 1
fi

brew bundle
brew bundle cleanup --force

exit 0
