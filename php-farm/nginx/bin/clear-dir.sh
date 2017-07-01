#!/bin/zsh

rm -f /etc/nginx/conf.d/*.conf
rm -f /etc/consul-templates/php/*.ctmpl

for service in $(wget -O - -q http://consul:8500//v1/catalog/services | jq -r 'keys[] | scan("php[0-9]+-[0-9]+-9000")'); do
    cat /etc/consul-templates/php-server.ctmpl | sed "s|%%SERVICE%%|$service|g" > /etc/consul-templates/php/$(echo -n $service | sed "s|-9000$||").ctmpl
done

sv hup consul-template-child
sv hup nginx