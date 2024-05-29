# To check any of the output value block compile using the following command: 
# terraform output output_block_name
provider "aws" {}

resource "aws_iam_user" "users" {
    name = "User.${count.index}"
    path = "/dev/null/"
    count = 3
}

# Terraform output ARNs
output "ARNs" {
    value = aws_iam_user.users[*].arn    # Splat expression
}

# Terraform output IDs
output "IDs" {
    value = aws_iam_user.users[*].id    # Retrieves the ID for all [*] created users
}