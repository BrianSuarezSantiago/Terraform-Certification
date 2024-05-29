provider "aws" {}

# To correctly check the funtionallity of the lifecycle meta argument, through the AWS Console
# add a new tag with a key-value pair and then run the terraform plan or apply command. You must
# see "No changes." message in the log.
resource "aws_instance" "ec2" {
    ami = "ami-01f10c2d6bce70d90"
    instance_type = "t2.micro"

    tags = {
        Name = "TF-EC2"
    }

    lifecycle {
        ignore_changes = [tags]
    }
}