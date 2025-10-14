# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Copy startup script and set proper permissions
COPY --chmod=0755 start-render.sh /start-render.sh

# Use /bin/sh (not bash) to run our startup script
ENTRYPOINT ["/bin/sh", "/start-render.sh"]
