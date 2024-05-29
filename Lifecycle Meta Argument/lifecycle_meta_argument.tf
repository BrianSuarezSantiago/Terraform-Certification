provider "aws" {}

resource "aws_instance" "ec2" {
    ami = "ami-01f10c2d6bce70d90"
    instance_type = "t2.micro"

    tags = {
        Name = "TF-EC2"
    }

    lifecycle {
        ignore_changes = [tags]    # With this attribute setted to true, it will not take into account any change
                                   # on tags, it does not matter if we changed manually or through Terraform.   
        prevent_destroy = true    # With this attribute setted to true it is impossible to remove it by using destroy command
    }
}