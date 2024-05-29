variable "ports" {
    description = "Variable that holds the ports to apply the firewall rules"
    type = list(string)
    default = ["22", "80", "443"]
}

resource "aws_security_group" "sg" {
    name = "Dynamic TF SG"
    description = "Dynamic SG"

    dynamic "ingress" {
        for_each = var.ports
        iterator = port    # Local scope

        content {
            from_port = port.value
            to_port = port.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0", "172.17.0.0/32"]
        }
    }

    dynamic "egress" {
        for_each = var.ports
        iterator = i

        content {
            from_port = i.value
            to_port = i.value
            protocol = "udp"
            cidr_blocks = ["180.0.0.0/16"]
        }
    }
}