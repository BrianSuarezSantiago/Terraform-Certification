provider "aws" {}

resource "aws_instance" "vm" {
    ami = "ami-0154dbce80029f1c3"
    instance_type = "t2.micro"

    tags = {
        Name = "local-exec VM"
    }

    # With the local-exec provisioner we run a command from our local machine
    provisioner "local-exec" {
        # We use ${} notation just when the object exists in our code or project
        # command = "echo IP: ${aws_instance.vm.public_ip} > ip_address.txt"    # This option is correct
        command = "echo IP: ${self.public_ip} > ip_address.txt"    # This option is also correct
        # In this case, instead of reference all the resource (aws_instance.vm.attribute_name) we use self
        # because the provisioner block is defined in the own resource block itself, so we can omit it.
    }
}