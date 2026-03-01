#!/bin/bash
# Claude Code Notification hook: notify when waiting for user confirmation

input=$(cat)
message=$(echo "$input" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('message', '確認が必要です'))" 2>/dev/null || echo "確認が必要です")

terminal-notifier \
  -title "Claude Code" \
  -message "$message" \
  -sound default \
  -group "claude-code-notification"
