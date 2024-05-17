provider "aws" {
    region = "eu-west-2" 
}

data "aws_instances" "instances_information" {}

output "Region-" {
    # value = data.resource_type.local_resource_name.attribute_name
    # If we do not specify any attribute, the output value block will
    # print through CLI all the information related with the resource.
    value = data.aws_instances.instances_information.ids
}