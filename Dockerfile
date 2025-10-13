FROM n8nio/n8n:1.55.0

# Copy startup script and set proper permissions
COPY --chmod=0755 start-render.sh /start-render.sh

# Run it via bash so Render doesn't override /bin/sh
CMD ["/bin/bash", "/start-render.sh"]
