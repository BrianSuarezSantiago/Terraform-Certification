# Authentication stage
provider "aws" {
    region = "eu-west-2"
    # We do not include the "access_key" and "secret_key" arguments
    # Terraform will check the "config" and "credential" files under the ".aws" folder
}

# Resource creation (IAM User)
resource "aws_iam_user" "aws_user" {
    name = "Terraform-Automated-User"
}

# Resource creation (EC2 Instance)
resource "aws_instance" "mv" {
    ami = "ami-008ea0202116dbc56"
    instance_type = "t2.micro"
}