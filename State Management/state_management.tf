# To test the Terraform state management functionallity use the following commands:
# *! Disclaimer: All the commands must start with: terraform state <command>
# list --> To list all the resources present in the state file (.tfstate)
# mv --> To rename a resource (mv resource_type.current_local_resource_name resource_type.new_local_resource_name)
# pull --> To fetch all the information of the state file which is located in a remote backend and show through the console
# push  --> To upload a local state file to the remote backend
# rm --> To make Terraform not able to manage an specific resource
# show --> To show all the attributes and associated values of a single resource

provider "aws" {}

resource "aws_instance" "vm" {
    ami = "ami-0b53285ea6c7a08a7"
    instance_type = "t2.micro"
}

resource "aws_iam_user" "users" {
    name = "User-TF"
    path = "/dev/null/"
}