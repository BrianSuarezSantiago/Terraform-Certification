terraform {
    backend "s3" {
        # This backend is for this specific project, it has nothing to do with the backend of network project
        bucket = "brian-terraform-backend"
        key = "security/security_group_remote_state.tfstate"
        region = "eu-west-2"
    }
}