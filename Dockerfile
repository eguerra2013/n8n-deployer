# Use the official n8n image
FROM n8nio/n8n:1.55.0

# Temporarily use root to copy & fix permissions
USER root

# Copy the script
COPY start-render.sh /start-render.sh

# Strip CRLF if present and make it executable
RUN sed -i 's/\r$//' /start-render.sh && chmod 755 /start-render.sh

# Drop back to the normal user
USER node

# Run our script (the image's ENTRYPOINT stays the default)
CMD ["/start-render.sh"]
