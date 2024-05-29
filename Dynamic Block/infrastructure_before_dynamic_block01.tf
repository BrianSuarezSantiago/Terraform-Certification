provider "aws" {}

resource "aws_security_group" "security_group" {
    name = "Terraform Security Group"
    description = "Security group created with Terraform"

    tags = {
        Env = "Production"
        Capacity = "Finance"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.security_group.id
    from_port = "22"
    to_port = "22"
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    description = "Inbound rule to allow ssh from all sources"
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
    security_group_id = aws_security_group.security_group.id
    from_port = "80"
    to_port = "80"
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    description = "Inbound rule to allow http requests from all sources"
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
    security_group_id = aws_security_group.security_group.id
    from_port = "443"
    to_port = "443"
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    description = "Inbound rule to allow https requests from all sources"
} 

data "aws_instances" "instances_information" {}

output "IDs-" {
    value = data.aws_instances.instances_information.ids
}