resource "aws_security_group" "sg" {
    name = "TF-SG"
    description = "Security group created for security project"

    ingress {
        description = "Allows incoming HTTP connections"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allows incoming HTTPS connections"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        # data.terraform_remote_state.local_data_name_of_terraform_remote_state_block.outputs.remote_output_name_where_to_fetch_the_value
        cidr_blocks = ["${data.terraform_remote_state.eip.outputs.ip_address}/32"]

    }
}