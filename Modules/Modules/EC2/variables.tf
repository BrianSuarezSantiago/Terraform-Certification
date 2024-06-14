variable "ami" {
    description = "Contains the AMI of the Virtual Machine"
    type = string
    # This value is overwritten by the final user
}

variable "instance_type" {
    description = "Contains the type of the instance to be created"
    type = string
    # This value is overwritten by the final user
}