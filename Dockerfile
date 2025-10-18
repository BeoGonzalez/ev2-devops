FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql mysqli \
    && docker-php-ext-enable pdo pdo_mysql mysqli \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./src /var/www/html/

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80