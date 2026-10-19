resource "aws_security_group" "grupo-seguridad" {
    name = "grupo-seguridad-bastion"
    vpc_id = aws_vpc.my-vpc[0].id
    egress {
        from_port = var.salidas-grupo-seguridad["salidas-todo"].from_port
        to_port = var.salidas-grupo-seguridad["salidas-todo"].to_port
        protocol = var.salidas-grupo-seguridad["salidas-todo"].ip_protocol
        cidr_blocks = var.salidas-grupo-seguridad["salidas-todo"].cidr_ipv4
        }
    ingress {
        from_port = var.entradas-grupo-seguridad["ssh-ingress"].from_port
        to_port = var.entradas-grupo-seguridad["ssh-ingress"].to_port
        protocol = var.entradas-grupo-seguridad["ssh-ingress"].ip_protocol
        cidr_blocks = var.entradas-grupo-seguridad["ssh-ingress"].cidr_ipv4
    }
    tags = {
        Name = "grupo-seguridad-bastion"
    }
}



