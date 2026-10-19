variable "cidr-groups-vpc" {
    description = "Grupo de cidrs"
    type = list(string)
}

variable "cidr-group-subnet"{
    description = "Grupos de cidrs de subredes"
    type = map(string)
}

variable "zona_disponibilidad" {
    description = "Zonas de disponibilidad"
    type = list(string)
}

variable "instancias" {
    description = "opciones para intancias"
    type = map(object({
        ami = string
        instance_type = string
    }))
}

variable "entradas-grupo-seguridad" {
    description = "Definimos las reglas de entrada de nuestro grupo de seguridad"
    type = map(object({
        cidr_ipv4 = list(string)
        from_port = number
        ip_protocol = string
        to_port = number
    }))
}

variable "salidas-grupo-seguridad" {
    description = "Reglas de salida para el grupo de seguridad"
    type = map(object({
        from_port = number
        to_port = number
        ip_protocol = string
        cidr_ipv4 = list(string)
    }))
}