provider "aws" {}

resource "aws_instance" "vm" {
    ami = "ami-06373f703eb245f45"
    instance_type = lookup(var.instance_types, terraform.workspace, "Not workspace found.")
}

# For each of the workspaces, a subfolder is created underneath "terraform.tfstate.d" folder
variable "instance_types" {
    description = "Contains the instance type depending upon the workspace we are currently on"
    type = map(string)
    default = {
        # Workspaces
        default = "t2.nano"
        dev = "t2.micro"
        prod = "t2.large"
    }
}

/*
Workspaces:

We want to achieve the following configuration depending upon
the environment where we are deploying the infrastructure:

default ---> instance_type = "t2.nano"
dev ---> instance_type = "t2.micro"
prod ---> instance_type = "t2.large"
*/