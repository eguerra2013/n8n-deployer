# Use the official n8n image
FROM n8nio/n8n:1.55.0

# --- make sure our startup script is present & executable ---
# copy to a conventional bin path
COPY start-render.sh /usr/local/bin/start-render

# normalize line endings (fixes /bin/sh^M issues) and add exec perms
RUN sed -i 's/\r$//' /usr/local/bin/start-render && \
    chmod 755 /usr/local/bin/start-render

# run our script as the container entrypoint
ENTRYPOINT ["/usr/local/bin/start-render"]
