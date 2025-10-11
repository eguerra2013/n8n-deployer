# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Copy the startup script and set execute bits without a separate RUN step
COPY --chmod=0755 start-render.sh /start-render.sh

# Replace the base image entrypoint (which runs n8n) with our script
ENTRYPOINT ["/bin/sh", "/start-render.sh"]
