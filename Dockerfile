# Pin to a stable n8n version
FROM n8nio/n8n:1.55.0

# Copy startup script and set proper permissions
COPY --chmod=0755 start-render.sh /start-render.sh

# IMPORTANT: keep the image's ENTRYPOINT (/docker-entrypoint.sh)
# and just tell it to run our script
CMD ["/start-render.sh"]
