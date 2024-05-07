provider "aws" {}

resource "aws_eip" "elastic_ip" {
    domain = "vpc"

    tags = {
        Name = "TF EIP"
    }
}

# Output value for an specific attribute to be displayed in CLI
output "public-ip" {
    value = aws_eip.elastic_ip.public_ip
}