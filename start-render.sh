#!/bin/sh
set -e

# Render provides $PORT; n8n expects N8N_PORT
export N8N_PORT="${PORT:-5678}"

# Build N8N_HOST from Render's external URL if user didn't set one
if [ -n "$RENDER_EXTERNAL_URL" ] && [ -z "$N8N_HOST" ]; then
  export N8N_HOST="$(echo "$RENDER_EXTERNAL_URL" | sed -e 's~^https\?://~~' -e 's~/~~')"
fi

# Start n8n (entrypoint remains active so PATH/ENV are correct)
exec n8n start
