provider "aws" {}

# To correctly check the problems associated with the use of count.index while referencing
# try to add a new username at the begginig of the list (variable usernames) and also change
# the count parameter (under the resource block) and after that, plan or apply it.
variable "usernames" {
    description = "Contains the names for each user"
    type = list(string)
    default = ["User-1", "User-2", "User-3"]
}

resource "aws_iam_user" "users" {
    name = var.usernames[count.index]    # We access in each iteration of the count loop trough the count.index
    path = "/dev/null/"
    count = 3
}