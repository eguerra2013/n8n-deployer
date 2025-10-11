# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Copy startup script and make it executable in one step
COPY --chmod=0755 start-render.sh /start-render.sh

# VERY IMPORTANT:
# 1) Clear the inherited ENTRYPOINT from the n8n image
# 2) Run our script as the default command
ENTRYPOINT []
CMD ["/bin/sh", "/start-render.sh"]
