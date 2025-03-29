#!/bin/bash
set -euo pipefail

# fisher plugins
fish -c "curl -sL git.io/fisher | source && fisher update"

# asdf plugin & global npm packages
set +e
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add python
asdf plugin-add golang
set -e
asdf install

# cheat.sh
fish -c "complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'"

