#!/bin/sh
# SSH経由でattachしたセッションだけprefixをCtrl+Tにする
# (SSH先の端末ではkarabiner経由のCtrl+Shift+Tを送れないため)
# usage: ssh-prefix.sh <socket_path> <session_id>
socket=$1 session=$2
if tmux -S "$socket" show-environment -t "$session" SSH_CONNECTION 2>/dev/null | grep -q '^SSH_CONNECTION='; then
  tmux -S "$socket" set-option -t "$session" prefix C-t
else
  tmux -S "$socket" set-option -t "$session" -u prefix
fi
