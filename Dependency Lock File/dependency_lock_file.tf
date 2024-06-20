# To correctly verify the behavior of the .terraform.lock.hcl file, first run a provider initialization
# using the current version by running the terraform init command and then, try to run the same command
# but fist change the constraint related to the provider's version. If everything is correct, you will
# see an error basically indicating that it is not possible to match the version specified in the .tf
# file to the one that was initially configured in the first run of terraform init.
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.0.0"    # Version constraint
        }
    }
}

resource "aws_eip" "eip" {
    domain = "vpc"
}