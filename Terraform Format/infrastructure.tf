# To test this functionality, compile using:
# > terraform fmt
# It is not neccessary to perfom a previous "terraform init"

# The original non modified code snippet was:
#provider "aws"  {}

#resource    "aws_instance"   "ec2_vm" {
#ami  =        "ami-123"
#instance_type="t2.micro" 
#}

# The result after applying the previous mentioned command is the following:
provider "aws" {}

resource "aws_instance" "ec2_vm" {
  ami           = "ami-123"
  instance_type = "t2.micro"
}