# To successfully test the funtionally of the "create_before_destroy" argument, change the AMI
# for another O.S AMI and take a look on terminal log how it create first instead of delete it.
# This happens because it is not possible to update in-place the O.S of a virtual machine.
resource "aws_instance" "vm" {
    ami = "ami-035cecbff25e0d91e"
    instance_type = "t2.micro"

    tags = {
        Name = "TF-EC2 v2.01"    # A change here is just an update in-place
    }

    lifecycle {
        ignore_changes = [tags]
        create_before_destroy = true    # With this attribute setted to true we change the default behaviour
                                        # of Terraform of deleting first the resource and then recreate it.
        /*This is quite useful in production environment were we want to replicate a exact configuration of
        a resource to be created before remove it. This allows to avoid destroy in first way a functional
        resource in the production environment.*/
    }
}