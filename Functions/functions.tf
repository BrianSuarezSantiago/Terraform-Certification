provider "aws" {}

resource "aws_instance" "virtual_machine" {
    ami = lookup(var.ami_ids, var.region, "No AMI found")    # Retrieves the value of a single element from a map, given its key. If the given key does not exist, the given default value is returned instead
    instance_type = "t2.micro"
    count = 2    # Number of resources to be created

    tags = {
        Name = element(var.instances_names, count.index)    # Retrieves a single element from a list
        # We use "count.index" to access the name of each instance through each iteration of the "count" loop in order to get the proper instance name to distiguish each of them
    }
}

# Output values
output "last-execution" {
    value = local.current_date
}