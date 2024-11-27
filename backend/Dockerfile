# backend/Dockerfile
FROM php:7.3.33-fpm-alpine3.15

# Install system dependencies for PDO and MySQL driver
RUN apk update && apk add --no-cache \
    # libpng-dev \
    # libjpeg-turbo-dev \
    # libwebp-dev \
    # libxml2-dev \
    bash \
    netcat-openbsd \
    # libzip-dev \
    mysql-client \
    && docker-php-ext-configure pdo_mysql \
    && docker-php-ext-install pdo_mysql
    # && docker-php-ext-install zip

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy existing application directory
COPY . .

# Install dependencies
RUN composer install

# Set permissions
RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www/storage
# RUN cp .env.example .env
# RUN php artisan key:generate && php artisan jwt:secret

# Copy and prepare start script
COPY start.sh /var/www/start.sh

# Set the script as executable and run it on container start
RUN sed -i 's/\r$//' /var/www/start.sh
RUN chmod 755 /var/www/start.sh

EXPOSE 8000

# Run the start script
# CMD ["php", "artisan", "serve", "--host=0.0.0.0"]
CMD ["/bin/sh", "/var/www/start.sh"]