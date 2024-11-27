#!/bin/sh

# Wait for MySQL to be ready (you might need to install netcat)
while ! nc -z app-mysql-master 3306; do
    echo "Waiting for MySQL to be ready..."
    sleep 3
done

# Run migrations
php artisan migrate:fresh --force --no-interaction

# Start the PHP built-in server
php artisan serve --host=0.0.0.0 --port=8000