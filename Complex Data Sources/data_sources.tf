provider "aws" {}

data "aws_instance" "instance_information" {
    # Error: multiple EC2 Instances matched; use additional constraints to reduce matches to a single EC2 Instance
    # As expected, we get an error if we do not specify any filter/constraint to fetch the information of a specific
    # EC2 instance, that is because "aws_instance" data source only fetch the information for a single virtual server

    filter {
        name = "tag:env"    # tag: key_name
        values = ["production"]    # value = ["value_name_corresponding_previous_key"]
    }
}

output "Information" {
    value = data.aws_instance.instance_information
    # If we do not specify any attribute, the data source (also known as: data resource) block will fetch all the
    # details of the specified resource type
}