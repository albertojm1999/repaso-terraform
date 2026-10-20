resource "aws_vpc" "my-vpc" {
    count      = length(var.cidr-groups-vpc)
    cidr_block = var.cidr-groups-vpc[count.index]
    tags       = {
                    Name = "vpc-${count.index}"
                }
}

resource "aws_vpc_peering_connection" "vpc1_vpc0" {
    vpc_id      = aws_vpc.my-vpc[1].id   
    peer_vpc_id = aws_vpc.my-vpc[0].id  
    auto_accept = true
}

resource "aws_subnet" "subred-publica" {
    vpc_id                  = aws_vpc.my-vpc[0].id
    cidr_block              = var.cidr-group-subnet["publica"]
    availability_zone       = var.zona_disponibilidad[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "mi-subred-publica"
    }
}

resource "aws_subnet" "subred-privada" {
    cidr_block              = var.cidr-group-subnet["privada"]
    vpc_id                  = aws_vpc.my-vpc[1].id
    availability_zone       = var.zona_disponibilidad[0]
    tags = {
        Name = "my-subred-privada"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-vpc[0].id
    tags = {
        Name = "mi-internet-gateway"
    }
}

resource "aws_route_table" "table-route-public" {
    vpc_id         = aws_vpc.my-vpc[0].id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    route {
        cidr_block = var.cidr-groups-vpc[1]
        vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc0.id
    }

    tags = {
        Name = "mi-table-route-public"
    }
}

resource "aws_route_table_association" "asoc-publica" {
    subnet_id      = aws_subnet.subred-publica.id
    route_table_id = aws_route_table.table-route-public.id
}

resource "aws_route_table" "table-route-private" {
    vpc_id                        = aws_vpc.my-vpc[1].id
    route {
        cidr_block                = "172.16.0.0/16"
        vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc0.id
    }
    tags = {
        Name = "mi-table-route-private"
    }
}

resource "aws_route_table_association" "asoc-privada" {
    subnet_id      = aws_subnet.subred-privada.id
    route_table_id = aws_route_table.table-route-private.id
}


