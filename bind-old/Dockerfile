FROM 00zi/base

RUN apk add --no-cache \
        bind \
        && mkdir -p /var/log/bind \
        && touch /var/log/bind/misc.log \
        && touch /var/log/bind/query.log \
        && chmod 664 /var/log/bind/* \
        && chown -R named:named /var/log/bind

COPY named.conf /etc/bind/named.conf

COPY zones/* /var/bind/pri/

EXPOSE 53

EXPOSE 53/udp

# /usr/sbin/named -f -u named -c /etc/bind/named.conf
CMD ["/usr/sbin/named", "-g", "-u", "named", "-c", "/etc/bind/named.conf"]