#!/bin/bash
set -euo pipefail

# fisher plugins
fish -c "curl -sL git.io/fisher | source && fisher update"

# claude code plugins
set +e
claude plugin install jdtls-lsp@claude-plugins-official
claude plugin install code-review@claude-plugins-official
claude plugin install pr-review-toolkit@claude-plugins-official
claude plugin install skill-creator@claude-plugins-official
set -e

mise install

# start background services
set +e
open -a AeroSpace
sleep 2
aerospace reload-config
set -e
