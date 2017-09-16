#!/bin/zsh

sed -i "s/\${DB_USER}/$DB_USER/g; s/\${DB_PASSWORD}/$DB_PASSWORD/g; s/\${HOST}/$HOST/g" /var/www/html/config.inc.php