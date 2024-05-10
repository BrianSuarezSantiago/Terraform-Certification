provider "aws" {}

variable "is_prod" {}

resource "aws_instance" "dev_env" {
    ami = "ami-008ea0202116dbc56"
    instance_type = "t2.micro"
    count = var.is_prod == false ? 1 : 0    # If "is_prod" is false, it means that we are in dev env, so count will be 1 (1 instance will be deploy)

    tags = {
        Name = "Dev"
        Environment = "Develop"
    }
}

resource "aws_instance" "prod_env" {
    ami = "ami-053a617c6207ecc7b"
    instance_type = "t2.micro"
    count = var.is_prod == true ? 1 : 0    # If "is_prod" is true, it means that we are in prod env, so count will be 1 (1 instance will be deploy)

    tags = {
        Name = "Prod"
        Environment = "Production"
    }
}