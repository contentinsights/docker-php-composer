ARG PHP_VERSION=7.2
FROM php:${PHP_VERSION}-cli

ARG PHP_EXT="bcmath sockets sodium zip"

RUN apt-get update \
    && \
    apt-get install --assume-yes zlib1g-dev libsodium-dev \
    && \
    apt-get clean \
    && \
    docker-php-ext-install $PHP_EXT \
    && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
