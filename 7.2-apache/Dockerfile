FROM php:7.2-apache

# Install php modules and git
RUN apt-get update && apt-get install -y \
   freetds-dev \
   libicu-dev \
   libpq-dev \
   libmcrypt-dev \
   libxml2-dev \
   git \
   default-mysql-client \
   zlib1g-dev \
   redis-tools \
&& rm -r /var/lib/apt/lists/* \
&& cp -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/ \
&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
&& docker-php-ext-install \
   mysqli \
   pdo_dblib \
   pdo_mysql \
   soap \
   zip \
   opcache

# Install redis extension for PHP
RUN mkdir -p cd /usr/src/php/ext \
    && cd /usr/src/php/ext \
    && git clone -b master --single-branch https://github.com/phpredis/phpredis.git \
    && cd phpredis \
    && phpize && ./configure && make && make install \
    && touch /usr/local/etc/php/conf.d/redis.ini && echo extension=redis.so > /usr/local/etc/php/conf.d/redis.ini

RUN a2enmod rewrite remoteip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp && chmod +x /usr/local/bin/wp

RUN apt-get -y clean \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

ENV SITEPATH=/var/www/html

COPY docker-init.sh /usr/local/bin/

COPY remoteip.conf /etc/apache2/mods-enabled

RUN chmod +x /usr/local/bin/docker-init.sh

CMD /usr/local/bin/docker-init.sh
