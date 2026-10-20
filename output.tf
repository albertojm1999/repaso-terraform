output "direcciones-publica-bastion" {
    value = aws_instance.instancia-bastion.public_ip
    description = "Mostrar la ip pública de la instancia que contiene el bastión."
}

output "direccion-privada-bastion" {
    value = aws_instance.instancia-bastion.private_ip
    description = "Mostrar la ip privada de la instancia que contiene el bastión."
}

output "direccion-privada-privada" {
    value = aws_instance.instancia-privada.private_ip
    description = "Mostrar la ip privada de la instancia privada."
}