#! /bin/bash
sed -i "s|DocumentRoot /var/www/html|DocumentRoot $SITEPATH|g" /etc/apache2/apache2.conf
apache2-foreground