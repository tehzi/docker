FROM 00zi/base

MAINTAINER zi "zi.white.drago@gmail.com"

ENV CV_VERSION=0.18.5
ENV CV_URL=https://releases.hashicorp.com/consul-template/$CV_VERSION/consul-template_${CV_VERSION}_linux_amd64.tgz

RUN deps=" \
        wget \
        ca-certificates \
    " \
    && progs=" \
        runit \
        jq \
        bind \
    " \
    && apk add --no-cache --virtual .deps $deps \
    && apk add --no-cache $progs \
    && update-ca-certificates \
    && wget -qO - $CV_URL | tar -C /usr/sbin -zxf - \
    && apk del .deps \
    && mkdir -p /etc/consul-templates/zone \
    && mkdir -p /var/bind/pri/generated

# templates
ADD templates/* /etc/consul-templates/

# config
ADD conf/named.conf /etc/bind/named.conf
ADD conf/named-additional.conf /etc/bind/named-additional.conf
ADD conf/consul-template.hcl /etc/consul-template.hcl

# service
ADD service/bind.service /etc/service/bind/run
RUN chmod a+x /etc/service/bind/run

ADD service/consul-template.service /etc/service/consul-template/run
RUN chmod a+x /etc/service/consul-template/run

ADD service/consul-template-child.service /etc/service/consul-template-child/run
RUN chmod a+x /etc/service/consul-template-child/run

# bin
ADD bin/update-services.sh /usr/sbin
RUN chmod a+x /usr/sbin/update-services.sh

# zones
COPY zones/* /var/bind/pri/

EXPOSE 53
EXPOSE 53/udp

CMD ["/sbin/runsvdir", "/etc/service"]