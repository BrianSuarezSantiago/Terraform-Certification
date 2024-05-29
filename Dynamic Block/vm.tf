variable "environments" {
    type = list(string)
    default = ["DEV", "PROD"]
    description = "Variable to host the different environments in the organization"
}

resource "aws_instance" "vm" {
    ami = "ami-01f10c2d6bce70d90"
    instance_type = "t2.micro"
    count = 2
    security_groups = ["Terraform Security Group", "default"]    # List of security group names to associate with

    tags = {
        Name = "VS - ${count.index + 1}"    # count and count.index start counting from 0 (as all programming languages)
        Env = var.environments[count.index]
    }
}