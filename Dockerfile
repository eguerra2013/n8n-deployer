# Use the official n8n image
FROM n8nio/n8n:1.55.0

# We need root to copy into /usr/local/bin and chmod
USER root

# Copy our startup script to a standard location
COPY start-render.sh /usr/local/bin/start-render

# Normalize line endings and make it executable
RUN sed -i 's/\r$//' /usr/local/bin/start-render \
 && chmod 755 /usr/local/bin/start-render

# Drop back to the normal non-root user for runtime
USER node

# Use our script as the container entrypoint
ENTRYPOINT ["/usr/local/bin/start-render"]
