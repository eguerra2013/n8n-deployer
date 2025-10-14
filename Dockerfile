# Use the official n8n image
FROM n8nio/n8n:1.55.0

# Temporarily switch to root user to copy and set permissions
USER root

# Copy startup script and give it execute permission
COPY start-render.sh /start-render.sh
RUN chmod 755 /start-render.sh

# Switch back to the non-root node user (for security)
USER node

# Keep the original entrypoint from n8n
CMD ["/start-render.sh"]
