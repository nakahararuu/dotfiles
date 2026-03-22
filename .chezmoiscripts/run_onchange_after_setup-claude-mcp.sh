#!/bin/bash
set -euo pipefail

if ! command -v claude >/dev/null 2>&1; then
  echo "claude command is not available; skipping Claude Code MCP bootstrap."
  exit 0
fi

reset_mcp_server() {
  local name="$1"
  shift

  claude mcp remove --scope user "$name" >/dev/null 2>&1 || true
  claude mcp add --scope user "$@"
}

reset_mcp_server github \
  --transport http \
  github \
  https://api.githubcopilot.com/mcp/ \
  --header 'Authorization: Bearer ${GITHUB_PAT_TOKEN}'

reset_mcp_server miro \
  --transport http \
  miro \
  https://mcp.miro.com/

reset_mcp_server context7 \
  context7 \
  -- \
  npx -y @upstash/context7-mcp@latest

reset_mcp_server slack \
  slack \
  --env 'SLACK_BOT_TOKEN=${SLACK_BOT_TOKEN}' \
  --env 'SLACK_TEAM_ID=${SLACK_TEAM_ID}' \
  --env 'SLACK_CHANNEL_IDS=${SLACK_CHANNEL_IDS}' \
  -- \
  npx -y @zencoderai/slack-mcp-server
