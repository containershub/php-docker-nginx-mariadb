FROM php:8.5-fpm-alpine

# Set working directory early so installer extensions respect paths if needed
WORKDIR /var/www/html

# Useful PHP extension installer image, copy binary into your container
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# Install PHP extensions
# OPTION A: MySQL Setup -> pdo pdo_mysql
# Exit on errors, exit on unset variables, print every command as it is executed
RUN set -eux; \
    install-php-extensions pdo pdo_mysql xdebug

# OPTION B: PostgreSQL Setup -> pdo pdo_pgsql
# RUN set -eux; \
#     install-php-extensions pdo pdo_pgsql xdebug

# Obtain composer using multi-stage build
# https://docs.docker.com/build/building/multi-stage/
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Dev image
# This stage is meant to be target-built into a separate image
# https://docs.docker.com/build/building/multi-stage/#stop-at-a-specific-build-stage
# FROM app as app_dev
#
# This environment will only be used for development so I don't need this extra dev image!

# Xdebug has different modes/functionalities. We can default to 'off' and set
# to 'debug' when we run docker compose up if we need it
ENV XDEBUG_MODE=off
