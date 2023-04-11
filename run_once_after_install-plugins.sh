#!/bin/bash
set -euo pipefail

# fisher plugins
fish -c "curl -sL git.io/fisher | source && fisher update"

# asdf plugin & global npm packages
set +e
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add python
set -e
asdf install

# cheat.sh
fish -c "complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'"

# tmux plugins
# see https://github.com/tmux-plugins/tpm/issues/6
if [ -e ~/.config/tmux/plugins/tpm ]; then
    cd ~/.config/tmux/plugins/tpm && git pull && cd - && \
    tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    ~/.config/tmux/plugins/tpm/scripts/update_plugin.sh
else
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm && \
    tmux start-server && \
    tmux new-session -d && \
    sleep 1 && \
    ~/.config/tmux/plugins/tpm/scripts/install_plugins.sh
fi
tmux kill-server

