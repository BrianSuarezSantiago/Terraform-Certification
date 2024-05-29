variable "sg_ports" {
    description = "Ports to be used for ingress rules"
    type = list(number)
    default = [22, 80, 443]    # Ports values
}

resource "aws_security_group" "dynamicSG" {
    name = "Dynamic SG"
    description = "Dynamic Security Group"

    dynamic "ingress" {
        for_each = var.sg_ports    # Iterates over each value contained in the sg_ports variable
        # If we do not specify the "iterator" attribute, the current element
        # will take the label name of the dynamic block ("ingress").
        iterator = i    # i holds the current value of the for_each loop
        content {
            #from_port = ingress.value    # Access mode to the current value if we do not use iterator
            from_port = i.value
            #to_port = ingress.value
            to_port = i.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]    # Incoming allowed source
        }
    }
}