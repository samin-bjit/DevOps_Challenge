# mysql/Dockerfile
FROM mysql:8.0

ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

# Set default environment variables
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

# Copy the script to the docker-entrypoint-initdb.d directory
COPY init-db.sh /docker-entrypoint-initdb.d/init-db.sh

# Set permissions for the script
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# # Copy custom MySQL configuration
# COPY my.cnf /etc/mysql/conf.d/

# # Copy initialization scripts
# COPY init.sql /docker-entrypoint-initdb.d/

# # Set permissions
# RUN chmod 644 /etc/mysql/conf.d/my.cnf

# Expose the default MySQL port
EXPOSE 3306