# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Copy startup script and make it executable in one step
COPY --chmod=0755 start-render.sh /start-render.sh

# Clear inherited ENTRYPOINT from base image
ENTRYPOINT []

# Use our startup script as the default command
CMD ["/bin/sh", "/start-render.sh"]
