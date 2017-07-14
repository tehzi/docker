consul {
    address = "consul:8500"
}

template {
    source = "/etc/consul-templates/consul-template.ctmpl"

    destination = "/etc/consul-template-child.hcl"

    command =  "/usr/sbin/update-services.sh"
}