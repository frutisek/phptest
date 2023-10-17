FROM php:7.1.2-apache 
RUN docker-php-ext-install mysqli
COPY /www/index.php /var/www/html/index.php


