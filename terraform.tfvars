cidr-groups-vpc = [ "172.16.0.0/16","172.17.0.0/16" ]

zona_disponibilidad = [ "us-east-1a" ]

cidr-group-subnet = {
    publica = "172.16.1.0/24"
    privada = "172.17.1.0/24"
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

entradas-grupo-seguridad = {
    ssh-ingress = {
        cidr_ipv4 = ["0.0.0.0/0"]
        from_port = 22
        ip_protocol = "tcp"
        to_port = 22
    }

}

salidas-grupo-seguridad = {
    salidas-todo = {
        from_port = 0
        to_port = 0
        ip_protocol = "-1"
        cidr_ipv4 = ["0.0.0.0/0"]
    }
}
