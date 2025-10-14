#!/bin/sh
set -e

echo "Starting n8n on Render..."

# Run database migrations (safe if no DB connected)
n8n migrate:database || true

# Start n8n with the official entrypoint
exec /docker-entrypoint.sh n8n start
