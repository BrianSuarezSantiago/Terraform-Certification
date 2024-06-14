terraform {
    backend "s3" {
        bucket = "brian-terraform-backend"
        key = "network/eip_remote_state.tfstate"    # The extension of the file must be specified
        region = "eu-west-2"
    }
}