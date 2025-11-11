data "aws_availability_zones" "available" {}


resource "aws_vpc" "this" {
cidr_block = var.vpc_cidr
enable_dns_hostnames = true
enable_dns_support = true
tags = { Name = var.project_prefix }
}


resource "aws_internet_gateway" "igw" { vpc_id = aws_vpc.this.id }


resource "aws_subnet" "public" {
count = length(var.public_subnets)
vpc_id = aws_vpc.this.id
cidr_block = var.public_subnets[count.index]
map_public_ip_on_launch = true
availability_zone = element(data.aws_availability_zones.available.names, count.index)
tags = { Name = "${var.project_prefix}-public-${count.index}" }
}


resource "aws_subnet" "private" {
count = length(var.private_subnets)
vpc_id = aws_vpc.this.id
cidr_block = var.private_subnets[count.index]
availability_zone = element(data.aws_availability_zones.available.names, count.index)
tags = { Name = "${var.project_prefix}-private-${count.index}" }
}


resource "aws_route_table" "public" {
vpc_id = aws_vpc.this.id
route { cidr_block = "0.0.0.0/0"; gateway_id = aws_internet_gateway.igw.id }
}


resource "aws_route_table_association" "public_assoc" {
count = length(aws_subnet.public)
subnet_id = aws_subnet.public[count.index].id
route_table_id = aws_route_table.public.id
}


resource "aws_security_group" "app" {
name = "${var.project_prefix}-app-sg"
vpc_id = aws_vpc.this.id
ingress { from_port = 80; to_port = 80; protocol = "tcp"; cidr_blocks = ["0.0.0.0/0"] }
egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
tags = { Name = "${var.project_prefix}-app-sg" }
}