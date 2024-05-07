provider "aws" {}

# Resource creation (EIP)
resource "aws_eip" "elastic_ip" {
    domain = "vpc"
}

# Resource creation (SG)
resource "aws_security_group" "security_group" {
    name = "Terraform SG"
    description = "SG created with Terraform"
}

# Resource creation (Ingress rule)
resource "aws_vpc_security_group_ingress_rule" "inbound_rule" {
    security_group_id = aws_security_group.security_group.id
    cidr_ipv4 = "${aws_eip.elastic_ip.public_ip}/32"    # Specify the EIP address from which source connections will be allowed
                                                        # String interpolation required due to mismatched formatting with cross-resource attribute reference
    from_port = 80
    ip_protocol = "TCP"
    to_port = 80
}

# Resource creation (Egress rule)
resource "aws_vpc_security_group_egress_rule" "outbound_rule" {
    security_group_id = aws_security_group.security_group.id    # Specify to which security group we want to allocate the egress rule
    cidr_ipv4 = "0.0.0.0/0"    # Incoming connections source
    from_port = 0
    ip_protocol = "TCP"
    to_port = 22
}