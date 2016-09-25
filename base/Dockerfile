FROM alpine:3.4

ENV HOME /root

COPY zshrc /root/.zshrc

RUN apk add --no-cache \
    htop \
    less \
    vim \
    zsh

RUN needable=" \
        git \
    " \
    && apk add --no-cache --virtual .deps \
        $needable \
    && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && apk del .deps $needable

CMD ["zsh"]