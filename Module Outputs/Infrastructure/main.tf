module "sg_module" {
    source = "../Modules/Security Group/"
    port = "80"
    protocol = "tcp"
    sources = ["0.0.0.0/0"]
}

resource "aws_instance" "vm" {
    ami = "ami-06373f703eb245f45"
    instance_type = "t2.micro"
    vpc_security_group_ids = [module.sg_module.sg-id]    # We want to attach the previous created security group (called by the module)
    # module.module_reference_name.output_value_name
}

# To be able to see the output through the CLI is necessary to override the output value block in the root file by using the same cross-referencing
output "sg_id_output" {
    value = module.sg_module.sg-id
}