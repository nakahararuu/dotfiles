#!/bin/bash
# Claude Code Stop hook: notify when waiting for user input

input=$(cat)
stop_hook_active=$(echo "$input" | python3 -c "import sys,json; print(json.load(sys.stdin).get('stop_hook_active', False))" 2>/dev/null)

# stop_hook_active が True のときは別の hook がすでに動いているので通知しない
if [ "$stop_hook_active" != "True" ]; then
  terminal-notifier \
    -title "Claude Code" \
    -message "入力待ちです" \
    -sound default \
    -group "claude-code-stop"
fi
