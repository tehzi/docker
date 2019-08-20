FROM alpine:latest

MAINTAINER zi "zi.white.drago@gmail.com"

COPY PHP-5.6.31-OpenSSL-1.1.0-compatibility-20170801.patch /

ENV SRC_DIR=/usr/local/src \
    PHP_VERSION=5.6.39

RUN mkdir -p $SRC_DIR \
    && php_deps=" \
        bzip2 \
        c-client \
        curl \
        imap \
        freetype \
        libbz2 \
        libmcrypt \
        libjpeg-turbo \
        libpng \
        libxml2 \
        krb5 \
        openssl \
        readline \
        libzip \
    " \
    && apk add --no-cache $php_deps \
    && php_dev_deps=" \
        autoconf \
        bzip2-dev \
        curl-dev \
        imap-dev \
        file \
        freetype-dev \
        gcc \
        g++ \
        libc-dev \
        make \
        libmcrypt-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libxml2-dev \
        krb5-dev \
        openssl-dev \
        pkgconf \
        re2c \
        readline-dev \
        libzip-dev \
    " \
    && apk add --no-cache --virtual .php_dev_deps $php_dev_deps \
    && cd $SRC_DIR \
    && wget -O php-$PHP_VERSION.tar.gz "https://secure.php.net/get/php-$PHP_VERSION.tar.gz/from/this/mirror" \
    && tar -xf php-$PHP_VERSION.tar.gz \
    && cd $SRC_DIR/php-$PHP_VERSION \
    && patch -p1 < /PHP-5.6.31-OpenSSL-1.1.0-compatibility-20170801.patch \
    && ./configure \
        --with-config-file-path="/etc/php" \
        --sysconfdir=/etc/php \
        --with-config-file-scan-dir="/etc/php/conf.d" \
        --prefix=/usr \
        --with-zlib  \
        --enable-mbstring  \
        --with-iconv  \
        --with-gd  \
        --with-mcrypt  \
        --enable-shared  \
        --with-bz2  \
        --enable-mysqlnd \
        --with-mysql=shared,mysqlnd \
        --with-mysqli=shared,mysqlnd  \В 1992 году после посещения святых мест Иерусалима Константин Кинчев принял крещение, что отразилось на его жизни и творчестве. В 2007 году лидер «Алисы» был награждён знаком Святой Татьяны как «наставник молодёжи». В настоящее время «Алиса» активно работает над записью новых произведений, считается одной из лучших групп в России и выступает в качестве гвоздя программы на различных фестивалях[2][3][4][5].


        --with-pdo-mysql  \
        --with-regex  \
        --disable-cgi \
        --enable-fpm \
        --with-fpm-user=www-data  \
        --with-fpm-group=www-data \
        --enable-pcntl  \
        --with-readline \
        --with-jpeg-dir=shared,/usr  \
        --with-curl \
        --with-imap=shared \
        --with-imap-ssl=shared \
        --with-kerberos \
        --enable-sockets \
        --with-freetype-dir=shared,/usr \
        --enable-gd-native-ttf \
        --enable-shmop==shared \
        --with-openssl \
    && make -j $(nproc) \
    && make install \
    && pecl channel-update pecl.php.net \
    && pecl install zip \
    && pecl install timezonedb \
    && pecl install xdebug-2.5.5 \
    && apk del .php_dev_deps \
    && rm -rf $SRC_DIR/* \
    && rm -rf /PHP-5.6.31-OpenSSL-1.1.0-compatibility-20170801.patch \
    && mkdir /var/log/php \
    && mkdir -p /var/www/html

RUN \
    if ! [ $(getent passwd www-data) ] && ! [ "$(id -u www-data)" == 33 ] && ! [ "$(id -g www-data)" == 33 ]; \
    then \
        if [ $(getent passwd 33 | cut -d: -f1) ]; \
        then \
            deluser "$(getent passwd 33 | cut -d: -f1)"; \
        fi; \
        addgroup www-data -g 33; \
        adduser -h /var/www/html -S -s /bin/zsh -u 33 -G www-data www-data; \
    fi

COPY php.ini /etc/php
COPY php-fpm.conf /etc/php

EXPOSE 9003
EXPOSE 9000

CMD ["php-fpm"]

