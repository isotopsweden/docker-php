#! /bin/bash

# Run before script if exists.
if [ -f "$BEFORE_APACHE_FILE" ]; then
  sh "$BEFORE_APACHE_FILE"
fi

sed -i "s#DocumentRoot /var/www/html\$#DocumentRoot $SITEPATH#" /etc/apache2/sites-enabled/000-default.conf
echo "Replaced document root with $SITEPATH"
apache2-foreground