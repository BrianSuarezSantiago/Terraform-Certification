resource "aws_iam_user" "users" {
    name = "User.${count.index}"
    path = "/dev/null/"
    count = 3
}

output "zipmap" {
    value = zipmap(aws_iam_user.users[*].name, aws_iam_user.users[*].arn)    # Directly used with a splat expression
}