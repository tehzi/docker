FROM ubuntu:12.04.5

MAINTAINER zi "zi.white.drago@gmail.com"

ENV HOME /root

RUN DEBIAN_FRONTEND=noninteractive \
    && library=" \
        less \
        vim \
        zsh \
    " \
    && apt-get update \
    && apt-get install --no-install-recommends -y $library \
    && deps=" \
        git \
    " \
    && apt-get install --no-install-recommends -y $deps \
    && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh \
    && apt-get purge -y $deps \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root

COPY zshrc /root/.zshrc

COPY zi.zsh /root/.oh-my-zsh/custom/config.zsh

CMD ["zsh"]