FROM 00zi/nginx

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
    " \
    && apk add --no-cache --virtual .deps $deps \
    && apk add --no-cache $progs \
    && update-ca-certificates \
    && wget -qO - $CV_URL | tar -C /usr/sbin -zxf - \
    && apk del .deps \
    && mkdir -p /etc/nginx/conf.d \
    && mkdir -p /etc/consul-templates/php

# templates
ADD templates/* /etc/consul-templates/
# config
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/fastcgi_params /etc/nginx/fastcgi_params
ADD conf/consul-template.hcl /etc/consul-template.hcl
ADD conf/consul-template-child.hcl /etc/consul-template-child.hcl

# services
ADD service/consul-template.service /etc/service/consul-template/run
RUN chmod a+x /etc/service/consul-template/run

ADD service/consul-template-child.service /etc/service/consul-template-child/run
RUN chmod a+x /etc/service/consul-template-child/run

ADD service/nginx.service /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run

# bin
ADD bin/clear-dir.sh /usr/sbin

CMD ["/sbin/runsvdir", "/etc/service"]
