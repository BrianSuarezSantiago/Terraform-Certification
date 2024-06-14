# Once applied the configuration, we will not see any .tfstate file stored locally because we are using a remote backend
resource "aws_eip" "elastic_ip" {
    domain = "vpc"
}