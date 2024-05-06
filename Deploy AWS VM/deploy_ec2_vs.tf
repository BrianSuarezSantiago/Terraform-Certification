# Initial authentication stage
provider "aws" {
    region = "eu-west-2"
    access_key = ""
    secret_key = ""
}

# EC2 Resource creation
resource "aws_instance" "automated_ec2_vm" {
    ami = "ami-035cecbff25e0d91e"    # Amazon Machine Image
    instance_type = "t2.micro"    # CPU and memory

    tags = {
        Name = "automated_ec2_vm_tf"    # Server name
    }
}