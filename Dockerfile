# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Simple startup wrapper so N8N_PORT matches Render's PORT
COPY start-render.sh /start-render.sh

# Don't chmod on Render's build FS. Run with bash instead.
CMD ["/bin/sh", "/start-render.sh"]
