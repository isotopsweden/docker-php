FROM php:5.5-apache

# Install redis extension for PHP
ENV PHPREDIS_VERSION=2.2.7
RUN cd /usr/src/php/ext \
    && curl -q https://codeload.github.com/phpredis/phpredis/tar.gz/$PHPREDIS_VERSION | tar -xz \
    && docker-php-ext-install phpredis-$PHPREDIS_VERSION

# Install php modules
RUN apt-get update && apt-get install -y \
   freetds-dev \
   libicu-dev \
   libpq-dev \
   libmcrypt-dev \
   git \
&& rm -r /var/lib/apt/lists/* \
&& cp -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/ \
&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
&& docker-php-ext-install \
   mbstring \
   mcrypt \
   pdo_dblib \
   pdo_mysql \
   soap \
   zip \
&& cd /usr/src/php \
&& make clean

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp && chmod +x /usr/local/bin/wp

ENV SITEPATH=/var/www/html

COPY docker-init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-init.sh

CMD /usr/local/bin/docker-init.sh