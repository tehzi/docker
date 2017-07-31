FROM 00zi/haproxy

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
    && apk del .deps

# templates
ADD templates/* /etc/consul-templates/

# config
ADD conf/haproxy.cfg /usr/local/etc/haproxy/
ADD conf/consul-template.hcl /etc/

# service
ADD service/haproxy.service /etc/service/haproxy/run
RUN chmod a+x /etc/service/haproxy/run

ADD service/consul-template.service /etc/service/consul-template/run
RUN chmod a+x /etc/service/consul-template/run

EXPOSE 80

CMD ["/sbin/runsvdir", "/etc/service"]