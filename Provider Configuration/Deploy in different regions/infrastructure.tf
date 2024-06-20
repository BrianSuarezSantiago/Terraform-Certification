resource "aws_eip" "eip_01" {
    domain = "vpc"
    provider = aws.ireland    # cloud_provider_name.alias_name
}

resource "aws_eip" "eip_02" {
    domain = "vpc"
    provider = aws.frankfurt    # aws.alias_name
}