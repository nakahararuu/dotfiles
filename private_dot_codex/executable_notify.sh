#!/bin/bash
# Codex notify hook: notify on approval/input/auth wait and task completion

input=$(cat)

message=$(printf '%s' "$input" | python3 -c '
import json
import sys

raw = sys.stdin.read()
fallback = "Codex から通知があります"

try:
    payload = json.loads(raw) if raw.strip() else {}
except Exception:
    print(fallback)
    raise SystemExit(0)

text = payload.get("message")
if isinstance(text, str) and text.strip():
    print(text.strip())
    raise SystemExit(0)

event = " ".join(
    str(payload.get(key, ""))
    for key in ("event", "type", "status", "title")
).lower()

wait_tokens = ("approve", "approval", "auth", "login", "confirm", "input", "prompt", "wait")
done_tokens = ("complete", "completed", "finish", "finished", "success", "succeeded", "done")

if any(token in event for token in wait_tokens):
    print("確認が必要です")
elif any(token in event for token in done_tokens):
    print("タスクが完了しました")
else:
    print(fallback)
' 2>/dev/null)

if [ -z "$message" ]; then
  message="Codex から通知があります"
fi

group=$(printf '%s' "$message" | python3 -c '
import hashlib
import sys

message = sys.stdin.read().strip() or "default"
print("codex-notify-" + hashlib.sha1(message.encode("utf-8")).hexdigest()[:12])
')

if command -v terminal-notifier >/dev/null 2>&1; then
  terminal-notifier \
    -title "Codex" \
    -message "$message" \
    -sound default \
    -group "$group" >/dev/null 2>&1 || true
fi
