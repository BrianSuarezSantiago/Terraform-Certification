provider "aws" {}

resource "aws_iam_user" "users" {
    name = var.usernames[count.index]    # var.variable_name[index] allows to access to an specific index
    path = "/dev/null/"
    count = 3    # Number of instances to be created (Number of times that the resource block will iterate)
}