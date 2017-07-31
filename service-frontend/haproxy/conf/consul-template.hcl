consul {
    address = "consul:8500"
}

template {
    source = "/etc/consul-templates/haproxy.ctmpl"

    destination = "/usr/local/etc/haproxy/haproxy.cfg"

    command =  "sv hup haproxy"
}