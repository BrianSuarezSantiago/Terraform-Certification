data "terraform_remote_state" "eip" {
    backend = "s3"    # Type of backend where the information is stored

    config = {
        # Exact path of the bucket and state file where we want to retrieve the information from
        bucket = "brian-terraform-backend"
        key = "network/eip_remote_state.tfstate"    # This file contains an output value with the allocated IP
        region = "eu-west-2"  
    }
}