provider "aws" {}

resource "aws_iam_user" "user" {
    name = "failure-behaviour"

    provisioner "local-exec" {
        command = "The user was successfully created."
        when = create
        on_failure = continue    # As we changed the default Terraform behaviour, if we take a look at
                                 # the .tfstate file, we will see there is not "status" section marked
                                 # as a tainted, now it appear "mode" section with value managed.
    }

    # Do not forget to run terraform destroy command
    provisioner "local-exec" {
        command = "echo The user was deleted!"
        when = destroy
    }
}