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

# claude code plugins
claude plugin install jdtls-lsp@claude-plugins-official
claude plugin install code-review@claude-plugins-official
claude plugin install pr-review-toolkit@claude-plugins-official
set -e

asdf install


