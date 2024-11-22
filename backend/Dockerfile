# api/Dockerfile
FROM php:7.3.33-fpm-alpine3.15

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory
COPY . .

# Install dependencies
RUN composer install

# Set permissions
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www/storage

EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0"]
