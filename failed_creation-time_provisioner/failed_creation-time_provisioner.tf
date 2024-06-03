provider "aws" {}

resource "aws_iam_user" "user" {
    name = "creation-time"

    provisioner "local-exec" {
        # The below command is not a valid command, so Terraform will create the resource but then,
        # the creation-time provisioner will not be completed successfully so the resource will be
        # marked as a tainted. To check this, first take a look at the IAM control centre and check
        # the created user and then take a look at the .tfstate file under the "status" section.
        command = "The user was successfully created."
        when = create
    }

    # Do not forget to run terraform destroy command once you finish
    provisioner "local-exec" {
        command = "echo The user was deleted!"
        when = destroy
    }
}