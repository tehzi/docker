FROM alpine:3.4

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
    && sed -i '/root/s/ash/zsh/g' /etc/passwd

WORKDIR /root

COPY zshrc /root/.zshrc

COPY zi.zsh /root/.oh-my-zsh/custom/config.zsh

CMD ["zsh"]