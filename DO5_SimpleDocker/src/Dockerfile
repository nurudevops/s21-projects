FROM alpine:3.20

# Install dependencies in a single layer to reduce image size
RUN apk --no-cache --upgrade add \
    nginx \
    gcc \
    bash \
    curl \
    spawn-fcgi \
    fcgi-dev \
    musl-dev && \
    rm -rf /var/cache/apk/*

# Create non-root user and group
RUN addgroup -S nuru && \
    adduser -D nuru -G nuru && \
    mkdir -p /var/lib/nginx/logs /var/lib/nginx/tmp/client_body && \
    mkdir -p /run/nginx && \
    chown -R nuru:nuru /var/lib/nginx && \
    chown -R nuru:nuru /run/nginx && \
    chmod -R 775 /var/lib/nginx && \
    chmod -R 775 /run/nginx && \
    touch /var/lib/nginx/logs/error.log /var/lib/nginx/logs/access.log && \
    chown nuru:nuru /var/lib/nginx/logs/error.log /var/lib/nginx/logs/access.log && \
    chmod 664 /var/lib/nginx/logs/error.log /var/lib/nginx/logs/access.log

WORKDIR "/app/"

# Copy application files
COPY --chown=nuru:nuru ./server/mini_server.c /app/
COPY --chown=nuru:nuru ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --chown=nuru:nuru ./run.sh /app/

# Build and set permissions
RUN gcc mini_server.c -o mini_server -lfcgi && \
    chmod +x mini_server run.sh

# Expose ports
EXPOSE 81

# Switch to non-root user
USER nuru

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl --fail http://localhost:80/ || exit 1

# Set entrypoint
ENTRYPOINT ["/app/run.sh"]
