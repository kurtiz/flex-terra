resource "aws_vpc" "flexcube_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.flexcube_vpc.id
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.flexcube_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.flexcube_vpc.id
  cidr_block = var.private_subnet_cidr
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.flexcube_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# data "aws_vpc" "default" {
#   default = true
# }
#
# resource "aws_vpc_peering_connection" "flexcube_vpc_peering" {
#   peer_vpc_id = aws_vpc.flexcube_vpc.id
#   vpc_id      = data.aws_vpc.default.id
#   auto_accept = true
# }
#
# resource "aws_vpc_peering_connection_accepter" "accept_default" {
#   vpc_peering_connection_id = aws_vpc_peering_connection.flexcube_vpc_peering.id
#   auto_accept = true
# }
#
# resource "aws_route" "default_to_flexcube_vpc" {
#   route_table_id = aws_route_table.public_rt.id
#   destination_cidr_block = aws_vpc.flexcube_vpc.cidr_block
#   vpc_peering_connection_id = aws_vpc_peering_connection.flexcube_vpc_peering.id
# }
