# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Copy startup script and set permissions
COPY --chmod=0755 start-render.sh /start-render.sh

# Ensure /bin/sh exists (use shell explicitly)
SHELL ["/bin/bash", "-c"]

# Reset entrypoint and run script via bash
ENTRYPOINT ["/bin/bash", "/start-render.sh"]
