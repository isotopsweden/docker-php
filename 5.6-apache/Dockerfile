FROM php:5.6-apache

# Install php modules
RUN apt-get update && apt-get install -y \
   freetds-dev \
   libicu-dev \
   libpq-dev \
   libmcrypt-dev \
   libxml2-dev \
   git \
   bzip2 \
   zlib1g-dev \
   libzip-dev \
   redis-tools \
&& pecl install redis-2.2.8 \
&& rm -r /var/lib/apt/lists/* \
&& cp -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/ \
&& docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
&& docker-php-ext-enable redis \
&& docker-php-ext-install \
   mbstring \
   mcrypt \
   mysqli \
   pdo_dblib \
   pdo_mysql \
   soap \
   zip

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp && chmod +x /usr/local/bin/wp

RUN apt-get -y clean \
  && apt-get -y autoclean \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/* && rm -rf && rm -rf /var/lib/cache/* && rm -rf /var/lib/log/* && rm -rf /tmp/*

ENV SITEPATH=/var/www/html

COPY docker-init.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-init.sh

CMD /usr/local/bin/docker-init.sh
