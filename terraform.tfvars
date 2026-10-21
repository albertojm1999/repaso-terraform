cidr-groups-vpc = [ "172.16.0.0/16","172.17.0.0/16" ]

zona_disponibilidad = [ "us-east-1a" ]

cidr-group-subnet = {
    publica = "172.16.1.0/24"
    privada = "172.17.1.0/24"
    nat = "172.17.2.0/24"
}

instancias = {
    bastion = {
        ami = "ami-0b75f821522bcff85"
        instance_type = "t3.micro"
    }
    privada = {
        ami = "ami-0b75f821522bcff85"
        instance_type = "t3.micro"
    }
}

entradas-grupo-seguridad-bastion = {
    ssh-ingress = {
        cidr_ipv4 = ["0.0.0.0/0"]
        from_port = 22
        ip_protocol = "tcp"
        to_port = 22
    }

}

salidas-grupo-seguridad-bastion = {
    salidas-todo = {
        from_port = 0
        to_port = 0
        ip_protocol = "-1"
        cidr_ipv4 = ["0.0.0.0/0"]
    }
}

salidas-grupo-seguridad-privada = {

    salidas-todo = {
        from_port = 0
        to_port = 0
        ip_protocol = "-1"
        cidr_ipv4 = ["0.0.0.0/0"]
    }

}

entradas-grupo-seguridad-privada = {
    ssh-ingress = {
        from_port = 22
        to_port = 22
        ip_protocol = "tcp"
        cidr_ipv4 = ["172.16.0.0/16"]
    }

    ping-ingress = {
        from_port = 8
        to_port = 0
        ip_protocol = "icmp"
        cidr_ipv4 = ["172.16.0.0/16"]
    }

    ldap-ingress = {
        from_port = 389
        to_port = 389
        ip_protocol = "tcp"
        cidr_ipv4 = ["172.16.0.0/16"]
    }
}
