# Use the official n8n image
FROM n8nio/n8n:1.55.0

# Temporarily use root to copy & fix permissions
USER root
COPY start-render.sh /start-render.sh
RUN sed -i 's/\r$//' /start-render.sh && chmod 755 /start-render.sh
USER node

# Keep the default entrypoint and run our script
CMD ["/start-render.sh"]
