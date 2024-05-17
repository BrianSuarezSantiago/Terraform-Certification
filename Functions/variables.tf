variable "ami_ids" {
    type = map(string)
    default = {
        # Region    # Ami
       eu-west-1 = "ami-0dfdc165e7af15242"    # Ireland
       eu-west-2 = "ami-008ea0202116dbc56"    # London
       eu-west-3 = "ami-0111c5910da90c2a7"    # Paris
    }
}

variable "region" {
    type = string
    default = "eu-west-2"
}

variable "instances_names" {
    type = list(string)
    default = ["First EC2 instance", "Second EC2 instance"]
}

locals {
    current_date = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())    # Converts a timestamp into a different time format
    # timestamp() is another function that returns the current date in the specified format
}