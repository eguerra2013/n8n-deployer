#!/bin/sh
set -e

# Render gives $PORT; n8n expects N8N_PORT
export N8N_PORT="${PORT:-5678}"

# Hand control to the image's official entrypoint (keeps PATH/env right)
exec /docker-entrypoint.sh n8n start
