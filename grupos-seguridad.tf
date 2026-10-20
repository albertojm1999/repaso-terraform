resource "aws_security_group" "grupo-seguridad-bastion" {
    name = "grupo-seguridad-bastion"
    vpc_id = aws_vpc.my-vpc[0].id
    egress {
        from_port = var.salidas-grupo-seguridad-bastion["salidas-todo"].from_port
        to_port = var.salidas-grupo-seguridad-bastion["salidas-todo"].to_port
        protocol = var.salidas-grupo-seguridad-bastion["salidas-todo"].ip_protocol
        cidr_blocks = var.salidas-grupo-seguridad-bastion["salidas-todo"].cidr_ipv4
        }
    ingress {
        from_port = var.entradas-grupo-seguridad-bastion["ssh-ingress"].from_port
        to_port = var.entradas-grupo-seguridad-bastion["ssh-ingress"].to_port
        protocol = var.entradas-grupo-seguridad-bastion["ssh-ingress"].ip_protocol
        cidr_blocks = var.entradas-grupo-seguridad-bastion["ssh-ingress"].cidr_ipv4
    }
    tags = {
        Name = "grupo-seguridad-bastion"
    }
}

resource "aws_security_group" "grupo-seguridad-privada" {

    egress {
        
    }
    ingress {

    }
    tags = {
        Name = "grupo-seguridad-privada"
    }
}



