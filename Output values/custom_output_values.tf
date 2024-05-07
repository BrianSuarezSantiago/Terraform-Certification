resource "aws_eip" "elastic_ip1" {
    domain = "vpc"

    tags = {
        Name = "TF EIP1"
    }
}

# Output value for an specific attribute to be displayed in CLI with a custom format
output "public-ip-url" {
    value = "http:${aws_eip.elastic_ip1.public_ip}:8080"
}