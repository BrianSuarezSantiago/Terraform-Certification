module "ec2_module" {
    source = "../../Modules/EC2/"
    ami = "ami-06373f703eb245f45"
    instance_type = "t2.micro"
}