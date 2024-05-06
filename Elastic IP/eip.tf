provider "aws" {}

# Resource creation (Elastic IP address)
resource "aws_eip" "elastic_ip" {
    # This resource does not assing the elastic IP to an AWS resource
    # It only allocates the EIP address
    domain = "vpc"    # VPC = Virtual Private Cloud
}