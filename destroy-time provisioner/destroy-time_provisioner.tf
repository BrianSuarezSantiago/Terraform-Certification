provider "aws" {}

# To correctly test this type of provisioner and the use of "when" argument, run the terraform
# destroy command as well as, terraform apply command to check both, creation and deletion.
# In each command execution take a look at the Terraform State File (.tfstate) to guarantee it.
resource "aws_iam_user" "user" {
    name = "destroy-time"

    provisioner "local-exec" {
        command = "echo The user was successfully created."
        when = create
    }

    provisioner "local-exec" {
        command = "echo The user was deleted!"
        when = destroy
    }
}