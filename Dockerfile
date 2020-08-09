FROM composer:1.9.3 AS composer

FROM php:7.4.8-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1 

RUN apk update  \
    && apk add nginx mysql-client --no-cache  \
    && docker-php-ext-install pdo_mysql  \
    && mkdir -p /run/nginx 

COPY --from=composer /usr/bin/composer /usr/bin/composer

EXPOSE 80