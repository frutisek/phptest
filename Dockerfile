#FROM php:7.1.2-apache 
#RUN docker-php-ext-install mysqli
#COPY /www/index.php /var/www/html/index.php

# Use the official PHP 8.0 image as the base
FROM php:8.0-apache

# Install system dependencies
RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo_mysql

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set the document root to Laravel's public directory
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Copy the application files to the container
COPY ./www/ /var/www/html

# Set the working directory
WORKDIR /var/www/html


