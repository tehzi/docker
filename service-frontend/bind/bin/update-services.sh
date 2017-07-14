#!/bin/zsh

rm -f /var/bind/pri/generated/*.zone
rm -f /etc/consul-templates/zone/*.ctmpl


for service in $(wget -O - -q http://consul:8500//v1/catalog/services | jq -r 'keys[] | scan("php[0-9]+-[0-9]+-9000")'); do
    cat /etc/consul-templates/zone.ctmpl | sed "s|%%SERVICE%%|$service|g" > /etc/consul-templates/zone/$(echo -n $service | sed "s|-9000$||").ctmpl
done

sv once consul-template-child
sv reload consul-template-child
sv reload bind