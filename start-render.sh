#!/bin/sh
set -e

# Render provides $PORT; n8n expects N8N_PORT
export N8N_PORT="${PORT:-5678}"

# Default to https on Render
: "${N8N_PROTOCOL:=https}"

# Auto-detect host from Render
if [ -n "$RENDER_EXTERNAL_URL" ] && [ -z "$N8N_HOST" ]; then
  export N8N_HOST="$(echo "$RENDER_EXTERNAL_URL" | sed -e 's~^https\?://~~' -e 's~/~~')"
fi

# Build webhook URL
if [ -n "$N8N_HOST" ]; then
  export WEBHOOK_URL="${N8N_PROTOCOL}://${N8N_HOST}/"
fi

# Force Postgres
export DB_TYPE="${DB_TYPE:-postgresdb}"

# Start n8n
exec /docker-entrypoint.sh n8n start
