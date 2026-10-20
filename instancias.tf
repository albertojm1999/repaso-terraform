resource "aws_key_pair" "par-claves" {
    key_name = "par-claves-bastion"
    public_key = file("C:/Users/alber/claves/id_ed25519.pub")
}

resource "aws_instance" "instancia-bastion" {
    ami = var.instancias["bastion"].ami
    instance_type = var.instancias["bastion"].instance_type
    subnet_id = aws_subnet.subred-publica.id
    key_name = aws_key_pair.par-claves.key_name
    vpc_security_group_ids = [aws_security_group.grupo-seguridad-bastion.id]
    tags = {
        Name = "instancia-bastion"
    }
}

resource "aws_instance" "instancia-privada"  {
    ami = var.instancias["privada"].ami
    instance_type = var.instancias["privada"].instance_type
    key_name = aws_key_pair.par-claves.key_name
    subnet_id = aws_subnet.subred-privada.id
    vpc_security_group_ids = [aws_security_group.grupo-seguridad-privada.id]
    tags = {
        Name = "instancia-privada"
    }
}