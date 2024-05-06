# Specify cloud provider
provider "aws" {}

# Resource creation (Security Group)
# This security group does not include any inbound/outbound rule
# If we want to specify those rules, we need to use other Terraform resources
resource "aws_security_group" "firewall_sg" {
    # It will create an empty security group without rules on it
    name = "Terraform SG"
    description = "Security Group created with Terraform"
}

# Inbound rules
resource "aws_vpc_security_group_ingress_rule" "allow_80_from_all" {
    security_group_id = aws_security_group.firewall_sg.id
    cidr_ipv4 = "0.0.0.0/0"    # Source connections (From which IP address you want to allow)
    from_port = 80
    ip_protocol = "TCP"    # It can be also specified in lowercase 
    to_port = 80
    description = "Allow HTTP (PORT:80) connections"
}

# Outbound rules
resource "aws_vpc_security_group_egress_rule" "allow_all_connections" {
    # The server should be able to connect externally to all the resources
    security_group_id = aws_security_group.firewall_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "ALL"    # -1 Semantically equivalent to all protocols
    description = "Allow all outbound connections"
}