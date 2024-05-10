provider "aws" {}

resource "aws_security_group" "firewall_sg" {
    name = "Terraform SG"
    description = "Security group created with Terraform"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.firewall_sg.id
    cidr_ipv4 = var.ip_address
    from_port = 80
    ip_protocol = var.tcp_ip_protocol
    to_port = 80
    description = "Allow HTTP (PORT:80) connections"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.firewall_sg.id
    cidr_ipv4 = var.ip_address
    from_port = 22
    ip_protocol = var.tcp_ip_protocol
    to_port = 22
    description = "Allow SSH (PORT:22) connections"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ftp" {
    security_group_id = aws_security_group.firewall_sg.id
    cidr_ipv4 = var.ip_address
    from_port = 21
    ip_protocol = var.tcp_ip_protocol
    to_port = 21
    description = "Allow FTP (PORT:21) connections"
}