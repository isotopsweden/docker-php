#! /bin/bash
sed -i "s#^DocumentRoot /var/www/html\$#DocumentRoot $SITEPATH#" /etc/apache2/apache2.conf
echo "Replaced document root with $SITEPATH"
apache2-foreground