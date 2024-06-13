# Once apply the configuration, we will see not .tfstate file stored locally because we are using a remote backend
resource "aws_instance" "vm" {
    ami = "ami-06373f703eb245f45"
    instance_type = "t2.micro"
}