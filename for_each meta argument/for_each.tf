provider "aws" {}

variable "instance_types" {
    description = "Contains the type for each EC2 instance"
    type = map(string)
    default = {
        # Example of different ways allowed to defining keys of a map
        key1 = "t2.large"
        key2 = "t2.medium"
        "t2.micro" = "t2.micro"
    }
}

resource "aws_instance" "vm" {
    ami = "ami-06373f703eb245f45"
    for_each = var.instance_types
    instance_type = each.value
    key_name = each.key

    tags = {
        Name = each.value
    }
}