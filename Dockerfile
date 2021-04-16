FROM envoyr/http:latest

# Setup web assets
COPY www /app/www

# Setup directories, set permissions
RUN mkdir -p /app/.composer && \
    chown -R app:app /app

# Prepare folders and files
COPY etc/supervisor/conf.d /etc/supervisor/conf.d
COPY bin /opt/bin

# Start supervisord
CMD ["/usr/bin/supervisord", "--loglevel", "warn"]
