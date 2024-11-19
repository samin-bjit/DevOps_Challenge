# mysql/Dockerfile
FROM mysql:8.0

# Copy custom MySQL configuration
COPY my.cnf /etc/mysql/conf.d/

# Copy initialization scripts
COPY init.sql /docker-entrypoint-initdb.d/

# Set permissions
RUN chmod 644 /etc/mysql/conf.d/my.cnf