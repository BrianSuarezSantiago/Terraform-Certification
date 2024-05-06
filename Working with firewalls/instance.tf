# There is not need to specify again the cloud provider because it is specified in the "security-groups.tf" file
resource "aws_instance" "vm" {
    ami = "ami-008ea0202116dbc56"
    instance_type = "t2.micro"

    tags = {
        Name = "Server"
    }
}