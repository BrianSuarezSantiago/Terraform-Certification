# Compile using the following command:
# terraform graph > graph.dot
# For simplicity, use the "Graphviz" extension in Visual Studio Code to easily view the generated graph
provider "aws" {}

resource "aws_instance" "vm" {
    ami = "ami-123"
    instance_type = "t2.micro"
}

# 1st Resource Dependency
resource "aws_eip" "eip" {
    instance = aws_instance.vm.id    # Instance to attach the EIP
    domain = "vpc"
}

# 2nd Resource Dependency
resource "aws_security_group" "sg" {
    name = "SG"
    description = "Security group"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${aws_eip.eip.private_ip}/16", "172.0.0.0/32"]
    }
}