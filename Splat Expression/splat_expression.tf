provider "aws" {}

resource "aws_iam_user" "users" {
    name = "User.${count.index + 1}"
    path = "/dev/null/"
    count = 3
}

output "ARNs" {
    # value = resource_type.local_resource_name.attribute_name
    # value = aws_iam_user.users[0].arn    # Retrieves the ARN information for just a single specified index
    value = aws_iam_user.users[*].arn    # Retrieves the ARN information for all the users
}