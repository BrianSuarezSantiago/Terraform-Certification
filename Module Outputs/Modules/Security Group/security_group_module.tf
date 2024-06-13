resource "aws_security_group" "sg" {
    name = "TF-SG"
    description = "Security group created through Terraform to test Module Outputs"

    ingress {
        from_port = var.port
        to_port = var.port
        protocol = var.protocol
        cidr_blocks = var.sources
    }

    egress {
        from_port = var.port
        to_port = var.port
        protocol = var.protocol
        cidr_blocks = var.sources
    }
}

output "sg-id" {
    value = aws_security_group.sg.id
}