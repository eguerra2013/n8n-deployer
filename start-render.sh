#!/bin/sh
set -e

# Map Render’s PORT to what n8n expects
export N8N_PORT="${PORT:-5678}"

# Optional: infer host if Render sets it
if [ -n "$RENDER_EXTERNAL_URL" ] && [ -z "$N8N_HOST" ]; then
  N8N_HOST="$(echo "$RENDER_EXTERNAL_URL" | sed -e 's~^https\?://~~' -e 's~/~~')"
  export N8N_HOST
fi

# Debug info (optional)
echo "Starting n8n on Render..."
echo "PORT: $PORT"
echo "N8N_PORT: $N8N_PORT"
echo "N8N_HOST: $N8N_HOST"

# Use full path to n8n binary (inside the container)
exec node /usr/local/lib/node_modules/n8n/bin/n8n start
