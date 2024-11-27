#!/bin/bash

echo "Creating new user and granting privileges..."

mysql --user=root --password="${MYSQL_ROOT_PASSWORD}" --execute="
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    ALTER USER '${MYSQL_USER}' IDENTIFIED WITH mysql_native_password BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
"