resource "aws_eip" "elastic_ip2" {
    domain = "vpc"

    tags = {
        Name = "TF EIP2"
    }
}

# Output value for all attributes to be displayed in CLI
output "public-ip-attributes" {
    value = aws_eip.elastic_ip2
}