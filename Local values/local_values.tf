provider "aws" {}

# Defines a local value
locals {
    info_tags = {
        Name = "Virtual Machine"
        Owner = "Brian"
        Team = "DevOps"
    }
}

resource "aws_instance" "dev_env" {
    ami = "ami-008ea0202116dbc56"
    instance_type = "t2.micro"
    tags = local.info_tags    # Access to the local value
}

resource "aws_instance" "prod_env" {
    ami = "ami-053a617c6207ecc7b"
    instance_type = "t2.micro"
    tags = local.info_tags    # Access to the local value
}