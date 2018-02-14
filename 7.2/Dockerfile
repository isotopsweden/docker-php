FROM php:7.2

# Install php modules and git
RUN apt-get update && apt-get install -y \
   wget \
   git \
   unzip \
   bzip2 \
&& rm -r /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp && chmod +x /usr/local/bin/wp
