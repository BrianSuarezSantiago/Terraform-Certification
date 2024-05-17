provider "aws" {}

# Data source block to fetch the latest OS image
data "aws_ami" "os_image" {
    owners = ["amazon"]    # Owner of the AMI
    most_recent = true    # Always returns the latest version of the specified filtered resource (even if it is more than one)

    # Specify the desired OS image
    filter {
        name = "name"    # If the resource/object does not have tags, use "name" as a key if we want to filter taking into account some text
        values = ["Windows_Server-2022-English-Core-Base-*"]    # We use wildcard to avoid select a specific version and allows to fetch the latest one
        # The original name for this AMI is: "Windows_Server-2022-English-Core-Base-2024.04.10"
        # In this case, we remove the date (always matches with the latest update date) and we use wildcard to indicate to choose the appropiate version (most_recent = true)
    }
}

# The following resource block will take the latest Windows Server OS Image fetched from the previous data source block
resource "aws_instance" "vm" {
    ami = data.aws_ami.os_image.image_id    # Fetch directly from the data source block
    # With this method, we avoid hardcoding the AMI id --> ami = "ami-123"
    instance_type = "t2.micro"
}

output "id-latest-image" {
    value = data.aws_ami.os_image.image_id
}