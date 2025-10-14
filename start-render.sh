#!/bin/sh
set -e

# Map Render’s port to what n8n expects
export N8N_PORT="${PORT:-5678}"

# Optional: infer host if Render sets it
if [ -n "$RENDER_EXTERNAL_URL" ] && [ -z "$N8N_HOST" ]; then
  N8N_HOST="$(echo "$RENDER_EXTERNAL_URL" | sed -e 's~^https\?://~~' -e 's~/~~')"
  export N8N_HOST
fi

# Launch n8n using its built-in entrypoint
exec /docker-entrypoint.sh n8n start
