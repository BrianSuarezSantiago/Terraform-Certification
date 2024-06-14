resource "aws_eip" "eip" {
    domain = "vpc"
}

output "ip_address" {
    # Retrieves the created public IP address
    value = aws_eip.eip.public_ip
}