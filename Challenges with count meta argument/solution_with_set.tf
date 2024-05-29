variable "usernames2" {
    description = "Contains the names for each user"
    type = set(string)
    default = ["User-0", "User-1", "User-2", "User-0"]
}

resource "aws_iam_user" "users2" {
    for_each = var.usernames2
    name = each.key    # It is also available the option each.value to access the values if we are using a map
    path = "/dev/null/"
    # count = 4    # The "count" and "for_each" meta-arguments are mutually-exclusive, only one
                   # should be used to be explicit about the number of resources to be created.
}