FROM 00zi/base

MAINTAINER zi "zi.white.drago@gmail.com"

ENV SRC_DIR=/usr/local/src \
    VERSION=4.7.4 \
    DB_USER=example \
    DB_PASSWORD=example \
    HOST=127.0.0.1

ENV URL https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz
LABEL version=$VERSION

ADD config.inc.php /tmp
ADD entrypoint.sh /

RUN deps=" \
        openssl \
    " \
    && apk add --no-cache --virtual .deps $deps \
    && mkdir -p /var/www \
    && cd /var/www \
    && wget -O phpMyAdmin.tar.gz https://files.phpmyadmin.net/phpMyAdmin/${VERSION}/phpMyAdmin-${VERSION}-all-languages.tar.gz \
    && tar -xf phpMyAdmin.tar.gz \
    && mv phpMyAdmin-${VERSION}-all-languages html \
    && mv /tmp/config.inc.php /var/www/html/ \
    && rm -f phpMyAdmin.tar.gz \
    && rm -rf \
        /var/www/html/js/jquery/src/ \
        /var/www/html/js/openlayers/src/ \
        /var/www/html/setup/ \
        /var/www/html/sql/ \
        /var/www/html/examples/ \
        /var/www/html/test/ \
        /var/www/html/po/ \
        /var/www/html/templates/test/ \
        /var/www/html/phpunit.xml.* \
        /var/www/html/build.xml  \
        /var/www/html/composer.json \
        /var/www/html/RELEASE-DATE-$VERSION \
    && apk del .deps \
    && if ! [ $(getent passwd www-data) ] && ! [ "$(id -u www-data)" == 33 ] && ! [ "$(id -g www-data)" == 33 ]; \
    then \
        if [ $(getent passwd 33 | cut -d: -f1) ]; \
        then \
            deluser "$(getent passwd 33 | cut -d: -f1)"; \
        fi; \
        addgroup www-data -g 33; \
        adduser -h /var/www/html -S -s /bin/zsh -u 33 -G www-data www-data; \
    fi \
    && chown -R www-data:www-data /var/www/html \
    && find /var/www/html -type d -exec chmod 750 {} \; \
    && find /var/www/html -type f -exec chmod 640 {} \;

ENTRYPOINT ["/entrypoint.sh"]