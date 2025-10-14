# Use the official n8n image
FROM n8nio/n8n:1.55.0

# Copy our startup script into the container and make it executable
COPY start-render.sh /start-render.sh
RUN chmod +x /start-render.sh

# Keep the original entrypoint from n8n
CMD ["/start-render.sh"]
