#!/bin/zsh

sed -i "
    s/\${DB_USER}/$DB_USER/g;
    s/\${DB_PASSWORD}/$DB_PASSWORD/g;
    s/\${HOST}/$HOST/g;
    s/\${PMA_USER}/$PMA_USER/g;
    s/\${PMA_PASSWORD}/$PMA_PASSWORD/g
" /var/www/html/config.inc.php