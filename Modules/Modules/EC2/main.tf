resource "aws_instance" "vm" {
    ami = var.ami
    instance_type = var.instance_type

    tags = {
        Name = "EC2 module"
        Env = "Production" 
    }
}