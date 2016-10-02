FROM 00zi/base-ubuntu12.04

MAINTAINER zi "zi.white.drago@gmail.com"

ENV SRC_DIR=/usr/local/src

RUN utils=" \
        wget \
    " \
    && apt-get update \
    && apt-get install --no-install-recommends -y $utils \
    && cd $SRC_DIR \
    && wget http://repo.percona.com/apt/pool/main/p/percona-server-5.1/libmysqlclient16_5.1.73-rel14.12-624.precise_amd64.deb \
    && wget http://repo.percona.com/apt/pool/main/p/percona-server-5.1/libmysqlclient16-dev_5.1.73-rel14.12-624.precise_amd64.deb \
    && cd $SRC_DIR \
    && mysql_deps=" \
        libc6 \
        libssl1.0.0 \
        zlib1g \
    " \
    && apt-get install --no-install-recommends -y $mysql_deps \
    && dpkg -i libmysqlclient16_5.1.73-rel14.12-624.precise_amd64.deb \
    && mysql_dev_deps=" \
        zlib1g-dev \
    " \
    && apt-get install --no-install-recommends -y $mysql_dev_deps \
    && dpkg -i libmysqlclient16-dev_5.1.73-rel14.12-624.precise_amd64.deb \
    && cd $SRC_DIR \
    && php_deps=" \
        bzip2 \
        libxml2 \
        libjpeg8 \
        libpng12-0 \
        sendmail \
        libfreetype6 \
        libkrb5-3 \
        mcrypt \
        libreadline6 \
        libc-client2007e \
        libcurl3 \
        libzip2 \
    " \
    && apt-get install --no-install-recommends -y $php_deps \
    && php_dev_deps=" \
        patch \
        gcc \
        libxml2-dev \
        pkg-config \
        libcurl4-openssl-dev \
        libbz2-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
        libc-client2007e-dev  \
        libkrb5-dev \
        libmcrypt-dev \
        libreadline6-dev \
        libzip-dev \
        autoconf \
    " \
    && apt-get install --no-install-recommends -y $php_dev_deps \
    && ln -s /usr/lib/x86_64-linux-gnu/libjpeg.a /usr/lib/libjpeg.a \
    && ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib/libjpeg.so \
    && ln -s /usr/lib/x86_64-linux-gnu/libpng.a /usr/lib/libpng.a \
    && ln -s /usr/lib/x86_64-linux-gnu/libpng.so /usr/lib/libpng.so \
    && mkdir -p /usr/kerberos \
    && ln -s /usr/lib/x86_64-linux-gnu/ /usr/kerberos/lib \
    && ln -s /usr/lib64/x86_64-linux-gnu/ /usr/kerberos/lib64 \
    && wget --no-check-certificate https://github.com/tehzi/docker/raw/master/php5.2/patches.tar.bz2 \
    && wget http://museum.php.net/php5/php-5.2.17.tar.bz2 \
    && tar -xf patches.tar.bz2 \
    && tar -xf php-5.2.17.tar.bz2 \
    && cd php-5.2.17 \
    && patch -p1 < ../patches/php-5.2.17-libxml2.patch \
    && patch -p1 < ../patches/php-5.2.17-openssl.patch \
    && patch -p1 < ../patches/php-fpm.diff \
    && ./configure \
        --prefix=/usr \
        --with-config-file-path="/etc/php" \
        --with-config-file-scan-dir="/etc/php/conf.d" \
        --with-fpm-conf="/etc/php/php-fpm.conf" \
        --enable-fastcgi \
        --enable-fpm \
        --enable-force-cgi-redirect \
        --with-zlib  \
        --enable-mbstring  \
        --with-iconv  \
        --with-mysql  \
        --with-gd  \
        --with-mcrypt  \
        --enable-shared  \
        --with-bz2  \
        --with-mysqli  \
        --with-regex  \
        --enable-fpm  \
        --enable-pcntl  \
        --with-readline  \
        --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/  \
        --with-curl  \
        --with-pdo-mysql  \
        --with-imap  \
        --with-imap-ssl  \
        --with-kerberos \
        --enable-sockets \
        --with-freetype-dir=/usr/include/freetype2 \
        --enable-gd-native-ttf \
        --enable-shmop \
        --with-openssl \
    && make -j $(nproc) \
    && make install \
    && pecl install zip \
    && pecl install timezonedb \
    && pecl install xdebug-2.2.7 \
    && rm -r /var/lib/apt/lists/* \
    && apt-get purge -y $utils $mysql_dev_deps $php_dev_deps \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf $SRC_DIR/*

RUN mkdir /var/log/php

COPY php.ini /etc/php
COPY php-fpm.conf /etc/php

EXPOSE 9003
EXPOSE 9000

CMD ["php", "-x"]

