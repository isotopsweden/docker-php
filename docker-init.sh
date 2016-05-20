#! /bin/bash
sed -i "s|SITEPATH|$SITEPATH|g" /etc/apache2/sites-enabled/site.conf
apache2-foreground