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

# GitHub Configuration phase
provider github {
    token = ""
}

# Resource creation (GitHub repository)
resource "github_repository" "github_repo" {
    name = "GitHub-Automated-Repo"
    description = "Automated GitHub repository created with AWS"
    visibility = "private"
}