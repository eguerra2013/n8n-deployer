# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Simple startup wrapper so N8N_PORT matches Render's PORT
COPY start-render.sh /start-render.sh
RUN chmod +x /start-render.sh

# No build step needed — the official image already contains n8n
CMD ["/start-render.sh"]
