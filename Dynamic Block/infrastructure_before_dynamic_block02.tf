resource "aws_security_group" "securityGroup" {
    name = "TF-SG"
    description = "TF Security Group"

    # Nested blocks
    ingress {
        # Due to we are using a nested block inside the security group, it is not
        # neccessary to specify the security group ID (security_group_id attribute).
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0", "172.123.0.0/16"]
    }

    ingress {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0", "172.123.0.0/16"]
    }

    ingress {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0", "172.123.0.0/16"]
    }
}