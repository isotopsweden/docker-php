FROM isotopab/php:7.0-apache

ENV XDEBUG_PROFILER_DIR="/tmp/xdebug"

COPY xdebug-config.ini /usr/local/etc/php/conf.d/xdebug-config.ini

RUN mkdir -p $XDEBUG_PROFILER_DIR \
    && chmod 777 $XDEBUG_PROFILER_DIR \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-source delete

VOLUME $XDEBUG_PROFILER_DIR
