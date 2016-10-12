FROM nginx:mainline-alpine

MAINTAINER zi "zi.white.drago@gmail.com"

ENV SRC_DIR=/usr/local/src
ENV HOME /root

RUN apk add --no-cache \
        less \
        vim \
        zsh \
    && needable=" \
        git \
    " \
    && apk add --no-cache --virtual .deps \
        $needable \
    && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && apk del .deps $needable \
    && mkdir -p /var/www/html


RUN sed -i '/root/s/ash/zsh/g' /etc/passwd \
    && if ! [ $(getent passwd www-data) ] && ! [ "$(id -u www-data)" == 33 ] && ! [ "$(id -g www-data)" == 33 ]; \
    then \
        if [ $(getent passwd 33 | cut -d: -f1) ]; \
        then \
            deluser "$(getent passwd 33 | cut -d: -f1)"; \
        fi; \
        addgroup www-data -g 33; \
        adduser -h /var/www/html -S -s /bin/zsh -u 33 -G www-data www-data; \
    fi

WORKDIR /root

COPY zshrc /root/.zshrc

COPY zi.zsh /root/.oh-my-zsh/custom/config.zsh