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
    name = "grupo-seguridad-privada"
    vpc_id = aws_vpc.my-vpc[1].id
    egress {
        from_port = var.salidas-grupo-seguridad-privada["salidas-todo"].from_port
        to_port = var.salidas-grupo-seguridad-privada["salidas-todo"].to_port
        protocol = var.salidas-grupo-seguridad-privada["salidas-todo"].ip_protocol
        cidr_blocks = var.salidas-grupo-seguridad-privada["salidas-todo"].cidr_ipv4
    }
    dynamic "ingress" {
        for_each = var.entradas-grupo-seguridad-privada
        content {
            from_port = ingress.value.from_port
            to_port     = ingress.value.to_port
            protocol    = ingress.value.ip_protocol
            cidr_blocks = ingress.value.cidr_ipv4
        }
    }
    tags = {
        Name = "grupo-seguridad-privada"
    }
}



